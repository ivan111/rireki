#let draw-profile(data) = {
  let cur-date = text(size: 9pt, [#data.year 年 #data.month 月 #data.day 日現在])
  let name-kana = text(size: 9pt, [#data.sei-kana　#data.mei-kana])
  let name = stack(block(height: 11pt), text(size: 18pt, [#data.sei　#data.mei]), block(height: 11pt))
  let birth-date = text(size: 11pt, [#data.birth-year 年 #data.birth-month 月 #data.birth-day 日生　(満 #data.age 歳)])

  table(
    stroke: none,
    columns: (6em, 10em, 10em, 3em),

    table.cell(colspan: 2, text(size: 18pt, tracking: 0.5em, [*履歴書*])),
    table.cell(colspan: 2, align: right + bottom, cur-date),

    table.hline(y: 1, stroke: (thickness: 1.5pt)),
    table.vline(x: 0, start: 1, stroke: (thickness: 1.5pt)),
    table.vline(x: 4, start: 1, stroke: (thickness: 1.5pt)),

    text(size: 9pt, [ふりがな]), table.cell(colspan: 3, name-kana),

    table.hline(y: 2, stroke: (thickness: 0.5pt, dash: "dotted")),

    text(size: 9pt, [氏　　名]), table.cell(colspan: 3, name),

    table.hline(y: 3, end: 4, stroke: (thickness: 0.5pt)),
    table.vline(x: 3, start: 3, end: 4, stroke: (thickness: 0.5pt)),

    [], table.cell(align: horizon, colspan: 2, birth-date),
    table.cell(align: center + horizon, stack(dir: ltr, block(height: 2em), text(size: 11pt, [#data.gender]))),

    table.hline(y: 4, stroke: (thickness: 1.5pt)),
  )
}

#let draw-address(data) = {
  table(
    stroke: none,
    columns: (6em, 1fr, 10em),

    table.hline(y: 0, stroke: (thickness: 1.5pt)),
    table.vline(x: 0, stroke: (thickness: 1.5pt)),
    table.vline(x: 2, stroke: (thickness: 0.5pt)),
    table.vline(x: 3, stroke: (thickness: 1.5pt)),

    text(size: 9pt, [ふりがな]), text(size: 9pt, [#data.address-kana]), text(size: 9pt, [電話]),

    table.hline(y: 1, end: 2, stroke: (thickness: 0.5pt, dash: "dotted")),

    text(size: 9pt, [現住所]), text(size: 9pt, [〒 #data.post]), table.cell(rowspan: 2, align: center + horizon, text(size: 11pt, [#data.tel])),
    block(height: 1.5em), text(size: 11pt, [#data.address]),

    table.hline(y: 3, stroke: (thickness: 0.5pt)),

    text(size: 9pt, [ふりがな]), text(size: 9pt, []), text(size: 9pt, [電話]),

    table.hline(y: 4, end: 2, stroke: (thickness: 0.5pt, dash: "dotted")),

    text(size: 9pt, [連絡先]), text(size: 9pt, [〒]), table.cell(rowspan: 2, align: center + horizon, text(size: 11pt, [])),
    block(height: 1.5em), text(size: 11pt, [同上]),

    table.hline(y: 6, stroke: (thickness: 1.5pt)),
  )
}

#let draw-history(title, data) = {
  table(
    stroke: none,
    columns: (5em, 2em, 1fr),

    table.hline(y: 0, stroke: (thickness: 1.5pt)),
    table.vline(x: 0, stroke: (thickness: 1.5pt)),
    table.vline(x: 1, stroke: (thickness: 0.5pt, dash: "dotted")),
    table.vline(x: 2, stroke: (thickness: 0.5pt)),
    table.vline(x: 3, stroke: (thickness: 1.5pt)),

    table.header(
      table.cell(align: center + horizon, text(size: 11pt, [年])),
      table.cell(align: center + horizon, text(size: 11pt, [月])),
      table.cell(align: center + horizon, stack(dir: ltr, block(height: 13pt), text(size: 11pt, title), )),
    ),

    ..for (i, d) in data.enumerate() {(
      table.hline(y: i + 1, stroke: (thickness: 0.5pt)),

      table.cell(align: center + horizon, text(size: 11pt, [#d.year])),
      table.cell(align: center + horizon, text(size: 11pt, [#d.month])),
      table.cell(align: horizon, stack(dir: ltr, block(height: 13pt), text(size: 11pt, [　#d.desc]))),
    )},

    table.hline(y: data.len() + 1, stroke: (thickness: 1.5pt)),
  )
}

#let draw-box(height, desc) = {
  rect(width: 100%, height: height, stroke: (thickness: 1.5pt),
    text(size: 11pt, desc))
}

#let template(data) = [
#set text(lang:"ja", font: "Hiragino Mincho Pro")

#set page(
paper: "a4",
margin: (x: 24mm, y: 24mm)
)


#place(
  dx: 120mm,
  dy: 0mm,
  rect(width: 30mm, height: 40mm, stroke: (thickness: 0.5pt, dash: "dotted"),
  stack(spacing: 0.6em, block(height: 9pt), text(size: 9pt, [　写真]), text(size: 9pt, [　縦 40mm]), text(size: 9pt, [　横 30mm])))
)

#draw-profile(data)

#draw-address(data)

#draw-history([学歴], data.education)

#draw-history([職歴], data.work)

#draw-history([免許・資格], data.cert)

#draw-box(12em, [志望の動機、特技、アピールポイントなど])

#draw-box(1fr, [本人記入欄（特に給料・職種・勤務時間・勤務地・その他についての希望があれば記入）])
]

