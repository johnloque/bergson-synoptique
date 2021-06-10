## bergson-synoptique documentation

This repository contains two **synoptic editions of Henri Bergson's major works** (8 books from 1889 to 1934, including his two collections of essays and lectures) in the form a **TXM corpus**.

The 'raw' directory contains a synoptic edition based on a low-level encoding (the base-entity is the paragraph) whereas the 'tag' directory contains a synoptic edition based on a higher-level encoding (the base-entity is the word, including Part-Of-Speech & lemma tagging for each token). The second one also features token referencement, thanks to xsl sheets. Some of the scripts used to build these two editions can be found in my repository 'M2HN-thesis-scripts' (in the directory 'xml-edition').

XML sources are located in the 'src' sub-directories whereas the binary corpora are located in the 'bin' sub-directories.

This project allows philosophers to use TXM's statistical analytics tools while benefiting from the original pagination (for each page, the numerical transcription and the corresponding image from Gallica are displayed side by side), which ensures the texts' reliability and eases the quotation process.

Feel free to use this project for your own purpose, feel free to suggest any encoding improvement.

[text written using [Markdown syntax](https://about.gitlab.com/handbook/markdown-guide)]
