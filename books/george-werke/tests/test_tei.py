import unittest

from pipeline import tei

K = '<a href="/x" class="zenoTXKonk" title="Vorlage" name="{0}">[{0}]</a>'


def leaf(path, *paras):
    return {
        "path": path,
        "depth": 1,
        "title": path,
        "categories": ["Gedicht"],
        "html": "".join(f"<p>{p}</p>" for p in paras),
    }


class PageBreaks(unittest.TestCase):
    def test_markers(self):
        snap = {
            "fetched": "2026-01-01",
            "root": "http://example.org/",
            "nodes": [
                {"path": "/r", "depth": 0, "title": "r", "categories": [], "html": "<h2>R</h2>"},
                leaf("/r/a", K.format(5) + " eins", K.format(6) + " zwei"),
                leaf("/r/b", K.format(6) + " drei", K.format(6) + " vier", K.format(3) + " fünf"),
            ],
        }
        doc, anomalies = tei.make("ga04", snap, {})
        pbs = [pb.get("n") for pb in doc.iter("pb")]
        self.assertEqual(pbs, ["6", "7", "8"])
        # pb 8 precedes "vier", nothing is emitted before "fünf"
        lines = [l.text for l in doc.iter("l")]
        self.assertEqual(lines, ["eins", "zwei", "drei", "vier", "fünf"])
        order = [(e.tag, e.get("n") or e.text) for e in doc.iter("pb", "l")]
        self.assertEqual(order[-3:], [("pb", "8"), ("l", "vier"), ("l", "fünf")])
        self.assertEqual([(a[2], a[3]) for a in anomalies], [(6, "pb 8"), (3, "dropped")])


class SmallCaps(unittest.TestCase):
    def runs(self, text):
        return tei.small_caps([("t", text, ())])

    def test_mixed_case_line(self):
        self.assertEqual(
            self.runs("Und SÜHNE steht auf jeder gruft."),
            [("t", "Und ", ()), ("t", "sühne", ("#k",)), ("t", " steht auf jeder gruft.", ())],
        )

    def test_line_start_keeps_capital(self):
        self.assertEqual(self.runs("ICH · DU sind"), [("t", "Ich · du", ("#k",)), ("t", " sind", ())])

    def test_all_caps_unchanged(self):
        self.assertEqual(self.runs("MEINEM VATER"), [("t", "MEINEM VATER", ())])

    def test_roman_numerals_stay(self):
        self.assertEqual(self.runs("Manuel II. 2"), [("t", "Manuel II. 2", ())])


if __name__ == "__main__":
    unittest.main()
