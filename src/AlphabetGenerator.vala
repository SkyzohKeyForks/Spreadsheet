namespace Spreadsheet {

    /**
    * Generates identifier using the alphabet and an index.
    *
    * 0 -> A
    * 1 -> B
    * ...
    * 25 -> Z
    * 26 -> AA
    * 27 -> AB
    * ...
    * 701 -> ZZ
    * 702 -> AAA
    * 703 -> AAB
    */
    public class AlphabetGenerator : Object {

        private const string[] alphabet = { "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M",
                                            "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z" };

        private uint limit { get; set; }
        private uint index { get; set; }

        public AlphabetGenerator (uint limit = 26, uint start_at = 0) requires (limit > start_at) {
            this.limit = limit;
            this.index = start_at;
        }

        public AlphabetGenerator iterator () {
            return this;
        }

        public string get_at (uint index) {
            if (index >= alphabet.length) {
                return get_at ((index / alphabet.length) - 1) + get_at (index % alphabet.length);
            } else {
                return alphabet[index];
            }
        }

        public new string get () {
            var res = this.get_at (index);
            index++;
            return res;
        }

        public bool next () {
            return index < limit;
        }
    }
}
