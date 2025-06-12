#import "./lib/conf.typ": conf

#let member = json("../../member.json")

#show: doc => conf(
  title: (
    jp: "AI・OpenCVを用いたハンズフリーARグラスと電子カルテ連携による介護総合プラットフォームの開発",
    en: "Development of a Comprehensive Nursing Platform Using Hands-Free AR Glasses and Electronic Medical Record Integration with AI and OpenCV",
  ),
  school: member.school,
  member: member.students,
  teacher: member.teacher.join(", "),
  header: "J06",
  doc
)

= はじめに

昨今の高齢化社会において、介護の現場では効率的な情報共有と迅速な対応が求められています。本研究では、AIとOpenCVを活用し、ハンズフリーARグラスと電子カルテを連携させることで、介護業務の効率化と質の向上を目指します。

= 目的

= 研究・活動の内容

= 研究・活動の目的を果たすための調査・かつ移動内容

= 調査・活動の実施内容と成果

= 考察

= おわりに
