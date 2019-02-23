/* Terminal colors (16 first used in escape sequence) */
static const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#3d3d3d", /* black   */
  [1] = "#6673bf", /* red     */
  [2] = "#3ea290", /* green   */
  [3] = "#b0ead9", /* yellow  */
  [4] = "#31658c", /* blue    */
  [5] = "#596196", /* magenta */
  [6] = "#8292b2", /* cyan    */
  [7] = "#c8cacc", /* white   */

  /* 8 bright colors */
  [8]  = "#4d4d4d", /* black   */
  [9]  = "#899aff", /* red     */
  [10] = "#52ad91", /* green   */
  [11] = "#98c9bb", /* yellow  */
  [12] = "#477ab3", /* blue    */
  [13] = "#7882bf", /* magenta */
  [14] = "#95a7cc", /* cyan    */
  [15] = "#edeff2", /* white   */

  /* special colors */
  [256] = "#1b1b1b", /* background */
  [257] = "#c5c8c6", /* foreground */
};

/*
 * Default colors (colorname index)
 * foreground, background, cursor
 */
static unsigned int defaultfg = 257;
static unsigned int defaultbg = 256;
static unsigned int defaultcs = 257;

/*
 * Colors used, when the specific fg == defaultfg. So in reverse mode this
 * will reverse too. Another logic would only make the simple feature too
 * complex.
 */
static unsigned int defaultitalic = 7;
static unsigned int defaultunderline = 7;
