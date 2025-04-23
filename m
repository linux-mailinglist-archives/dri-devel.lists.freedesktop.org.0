Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EEE3A99799
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 20:15:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F94D10E233;
	Wed, 23 Apr 2025 18:15:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=mark.filion@collabora.com header.b="d6QHzvqZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o16.zoho.com (sender4-op-o16.zoho.com
 [136.143.188.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10C9D10E238
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 18:15:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1745432148; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=a02fPJ48FdbIi2oR2d3ncsWJluuU78EMRkNHEF9k+2xs3FLzzGeU3sYqaJyTUhVqHBXaTswFAIglNjmdNpzLyN6BroldnAq/sg1W6o3MDUzuNXCRnDb6R1xHwG4XWMSHP8bMr6PCLPUJQNgDykfzlJIlD1npUKw8vLpmTV+8kd0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1745432148;
 h=Content-Type:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc;
 bh=qsfqYlJ8HYk/MO4jnADcrqYYr8jLex2WpdVWJJEBqB4=; 
 b=ZysEZYgoLipGJFAqRHkXfQ2QJyBzapUMVUIN4CpnvUfiDkDj0PkzWoGmUOxkIpdVf+phhHe2G3wGvgLhINGEgpajQ9uiiTMUCsDSy1xxdee9KI7ci+H1G9auwofeqV0+kMBLWyrQi+A7l5/H3TiwYaa7zsy3251+0Wc6hNczbJY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=mark.filion@collabora.com;
 dmarc=pass header.from=<mark.filion@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745432148; 
 s=zohomail; d=collabora.com; i=mark.filion@collabora.com;
 h=Message-ID:Subject:Subject:From:From:To:To:Date:Date:Content-Type:MIME-Version:Message-Id:Reply-To:Cc;
 bh=qsfqYlJ8HYk/MO4jnADcrqYYr8jLex2WpdVWJJEBqB4=;
 b=d6QHzvqZM00iEmahYxh0FiMD8pJ4Zpo3JEjfU1AuMNeoAdfERHwMrwkjHcCakFFe
 xczflwuSadDpEGpcZKLGuntbGHjq58RWDhnWwydfNMqiQRubqQOAgwxoi3RkC4LQgH4
 VGCfcw/XmXVkH6KlJyPW6zSIIivgap3k14lsqsRo=
Received: by mx.zohomail.com with SMTPS id 1745432145476375.77644179565027;
 Wed, 23 Apr 2025 11:15:45 -0700 (PDT)
Message-ID: <f42fa7465f039bac512893fc8593f4c63cf6af27.camel@collabora.com>
Subject: Announcement: 2025 X.Org Foundation Election Candidates
From: Mark Filion <mark.filion@collabora.com>
To: dri-devel@lists.freedesktop.org
Date: Wed, 23 Apr 2025 14:15:44 -0400
Content-Type: multipart/alternative; boundary="=-AShNssFFTafBdHANIKXp"
User-Agent: Evolution 3.56.1 (3.56.1-1.fc42app2) 
MIME-Version: 1.0
X-ZohoMailClient: External
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--=-AShNssFFTafBdHANIKXp
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

To all X.Org Foundation Members:

The election for the X.Org Foundation Board of Directors will begin on
30 April 2025. We have five candidates who are running for four seats.
They are (in alphabetical order):

 * Andres Gomez
 * Arkadiusz Hiler
 * Megan Knight
 * Lyude Paul
 * Harry Wentland

Attached below are the Personal Statements each candidate submitted for
your consideration along with their Statements of Contribution that
they submitted with the membership application. Please review each of
the candidates' statements to help you decide whom to vote for during
the upcoming election.

If you have questions of the candidates, you should feel free to ask
them here on the mailing list.

The election committee will provide detailed instructions on how the
voting system will work when the voting period begins.

PLEASE NOTE:=C2=A0To participate in this election you MUST renew your
membership by 28 April 2025! Please go to the Members page for your
membership application or renewal.

Best,

Mark Filion, on behalf of the X.Org elections committee

----

Nominees (in alphabetical order)

Andres Gomez
Current Affiliation: Igalia

Personal Statement:

I have been an active Open Source contributor since 2003, participating
in projects like GNOME, and FreeDesktop, among others. I started to be
actively involved with OSS graphic drivers in 2014, where I continue
devoting much of my time, although from a coordination perspective for
our team of developers at Igalia.

By joining X.Org board I hope to give a bit more back to the community,
helping to get things done. Among other things, I've contributed to
create the graphic design for the public image of some past OSS events.
I'll be happy to work in other tasks, including the organization of
XDC. I could take part in the CfP committee, for example, or anything
else the board could need help with.

Arkadiusz Hiler
Current Affiliation: CodeWeavers

Personal Statement:

Gaming on Linux is one of the main driving forces for the development
of a lot of the technologies under the X.Org umbrella. I would like to
represent the gaming part of the user space.

During my 2 years on the board I've helped with finances and planning
for the freedesktop.org migration, assuring that it's sustainable.

I also have experience with running conferences and I'm more than happy
to help any future XDC organizers on the ground and with streaming the
events.

Megan Knight
Current Affiliation: Director of Software Communities, Arm

Personal Statement:

I am very new to the X.Org community, but eager to help out! I=E2=80=99ve b=
een
in open source for over a decade and have extensive experience planning
large scale OS events, engaging with communities, delivering on
Advocacy initiatives and being the translator between technical and
business decision makers. Currently, I am working on a proposal to
organize the upcoming 2026 edition of XDC and alsop plan to attend XDC
2025.

I currently serve as the Advocacy Chair for Yocto Project and in the
last four years have improved developer relations, improved
documentation and onboarding processes, increased their website SEO,
migrated/redesigned their website to increase traffic, produce(d) 5+
events a year from start to finish, and increased revenue by attracting
new members/upleveling existing members.

If elected, I look forward to diving deep into X.Org and will apply
these skills so developers can focus on building great tech.

Lyude Paul
Current Affiliation: Red Hat

Personal Statement:

Hi! My name is Lyude Paul, and I'm currently employed at Red Hat as a
Software Engineer. I'm also currently on the X.org Board of Directors
as X.org's Secretary, and am also a member of the CoC team. I've also
been a member of X.org for multiple years now and have contributed to a
plethora of various projects in the X.org/freedesktop.org/linux kernel
space such as: nova, nouveau, i915, amdgpu, the wayland protocol, igt-
gpu-tools, libinput, and more.

I've had a pretty long tenure on the board where I've accomplished a
number of cool things For instance, I restarted X.org's relationship
with VESA in order to give X.org members access to various VESA
specifications that they might not have access to otherwise without a
prior VESA membership. I worked to help enable X.og to provide funding
for professional CoC training for any X.org/freeesktop.org project that
requests it, and I've assisted through the transition of parent
foundations for X.org from SPI to SFC. I love working in this
community, and will do my best to serve the community throughout my
tenusre if re-elected to the board of directors.

Harry Wentland
Current Affiliation: AMD

Personal Statement:

I've been lucky to be paid to help improve the Linux Desktop experience
on AMD HW and in that capacity align with X.Org's mission to further
the state of the open-source desktop. A healthy, diverse, open-source,
and general-purpose desktop provides tremendous value to many people
and is a bulwark against corporate silos.

I've also been lucky to have previously served on X.Org's Board of
Directors. If I am elected I am happy to support the board wherever
needed, whether in supporting infrastructure, chasing sponsors, or
organizing the conference.

Statement of Contribution:

I maintain AMD's DRM/KMS driver and have lately been exploring beyond
that. I have also recently found myself helping to drive the color/HDR
effort forward in small ways.

--=-AShNssFFTafBdHANIKXp
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head><style>pre,code,address {
  margin: 0px;
}
h1,h2,h3,h4,h5,h6 {
  margin-top: 0.2em;
  margin-bottom: 0.2em;
}
ol,ul {
  margin-top: 0em;
  margin-bottom: 0em;
}
blockquote {
  margin-top: 0em;
  margin-bottom: 0em;
}
</style></head><body><div style=3D"caret-color: rgb(0, 0, 0); color: rgb(0,=
 0, 0); font-family: &quot;Adwaita Sans&quot;; font-style: normal; font-var=
iant-caps: normal; font-weight: 400; letter-spacing: normal; text-align: st=
art; text-indent: 0px; text-transform: none; white-space: normal; word-spac=
ing: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.4); -webkit-text-str=
oke-width: 0px; text-decoration: none;">To all X.Org Foundation Members:</d=
iv><div style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-famil=
y: &quot;Adwaita Sans&quot;; font-style: normal; font-variant-caps: normal;=
 font-weight: 400; letter-spacing: normal; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-=
tap-highlight-color: rgba(0, 0, 0, 0.4); -webkit-text-stroke-width: 0px; te=
xt-decoration: none;"><br></div><div style=3D"caret-color: rgb(0, 0, 0); co=
lor: rgb(0, 0, 0); font-family: &quot;Adwaita Sans&quot;; font-style: norma=
l; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; tex=
t-align: start; text-indent: 0px; text-transform: none; white-space: normal=
; word-spacing: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.4); -webk=
it-text-stroke-width: 0px; text-decoration: none;">The election for the X.O=
rg Foundation Board of Directors will begin on 30 April 2025. We have five =
candidates who are running for four seats. They are (in alphabetical order)=
:</div><div style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-f=
amily: &quot;Adwaita Sans&quot;; font-style: normal; font-variant-caps: nor=
mal; font-weight: 400; letter-spacing: normal; text-align: start; text-inde=
nt: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -web=
kit-tap-highlight-color: rgba(0, 0, 0, 0.4); -webkit-text-stroke-width: 0px=
; text-decoration: none;"><br></div><ul style=3D"caret-color: rgb(0, 0, 0);=
 color: rgb(0, 0, 0); font-family: &quot;Adwaita Sans&quot;; font-style: no=
rmal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: nor=
mal; word-spacing: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.4); -w=
ebkit-text-stroke-width: 0px; text-decoration: none;"><li>Andres Gomez</li>=
<li>Arkadiusz Hiler</li><li>Megan Knight</li><li>Lyude Paul</li><li>Harry W=
entland</li></ul><div style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, =
0); font-family: &quot;Adwaita Sans&quot;; font-style: normal; font-variant=
-caps: normal; font-weight: 400; letter-spacing: normal; text-align: start;=
 text-indent: 0px; text-transform: none; white-space: normal; word-spacing:=
 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.4); -webkit-text-stroke-=
width: 0px; text-decoration: none;"><br></div><div style=3D"caret-color: rg=
b(0, 0, 0); color: rgb(0, 0, 0); font-family: &quot;Adwaita Sans&quot;; fon=
t-style: normal; font-variant-caps: normal; font-weight: 400; letter-spacin=
g: normal; text-align: start; text-indent: 0px; text-transform: none; white=
-space: normal; word-spacing: 0px; -webkit-tap-highlight-color: rgba(0, 0, =
0, 0.4); -webkit-text-stroke-width: 0px; text-decoration: none;">Attached b=
elow are the Personal Statements each candidate submitted for your consider=
ation along with their Statements of Contribution that they submitted with =
the membership application. Please review each of the candidates' statement=
s to help you decide whom to vote for during the upcoming election.</div><d=
iv style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: &q=
uot;Adwaita Sans&quot;; font-style: normal; font-variant-caps: normal; font=
-weight: 400; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; -webkit-tap-h=
ighlight-color: rgba(0, 0, 0, 0.4); -webkit-text-stroke-width: 0px; text-de=
coration: none;"><br></div><div style=3D"caret-color: rgb(0, 0, 0); color: =
rgb(0, 0, 0); font-family: &quot;Adwaita Sans&quot;; font-style: normal; fo=
nt-variant-caps: normal; font-weight: 400; letter-spacing: normal; text-ali=
gn: start; text-indent: 0px; text-transform: none; white-space: normal; wor=
d-spacing: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.4); -webkit-te=
xt-stroke-width: 0px; text-decoration: none;">If you have questions of the =
candidates, you should feel free to ask them here on the mailing list.</div=
><div style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-family:=
 &quot;Adwaita Sans&quot;; font-style: normal; font-variant-caps: normal; f=
ont-weight: 400; letter-spacing: normal; text-align: start; text-indent: 0p=
x; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-ta=
p-highlight-color: rgba(0, 0, 0, 0.4); -webkit-text-stroke-width: 0px; text=
-decoration: none;"><br></div><div style=3D"caret-color: rgb(0, 0, 0); colo=
r: rgb(0, 0, 0); font-family: &quot;Adwaita Sans&quot;; font-style: normal;=
 font-variant-caps: normal; font-weight: 400; letter-spacing: normal; text-=
align: start; text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.4); -webkit=
-text-stroke-width: 0px; text-decoration: none;">The election committee wil=
l provide detailed instructions on how the voting system will work when the=
 voting period begins.</div><div style=3D"caret-color: rgb(0, 0, 0); color:=
 rgb(0, 0, 0); font-family: &quot;Adwaita Sans&quot;; font-style: normal; f=
ont-variant-caps: normal; font-weight: 400; letter-spacing: normal; text-al=
ign: start; text-indent: 0px; text-transform: none; white-space: normal; wo=
rd-spacing: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.4); -webkit-t=
ext-stroke-width: 0px; text-decoration: none;"><br></div><div style=3D"care=
t-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: &quot;Adwaita Sans=
&quot;; font-style: normal; font-variant-caps: normal; font-weight: 400; le=
tter-spacing: normal; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; word-spacing: 0px; -webkit-tap-highlight-color: =
rgba(0, 0, 0, 0.4); -webkit-text-stroke-width: 0px; text-decoration: none;"=
><b>PLEASE NOTE:</b><span class=3D"Apple-converted-space">&nbsp;</span>To p=
articipate in this election you MUST renew your membership by 28 April 2025=
! Please go to the Members page for your membership application or renewal.=
</div><div style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-fa=
mily: &quot;Adwaita Sans&quot;; font-style: normal; font-variant-caps: norm=
al; font-weight: 400; letter-spacing: normal; text-align: start; text-inden=
t: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webk=
it-tap-highlight-color: rgba(0, 0, 0, 0.4); -webkit-text-stroke-width: 0px;=
 text-decoration: none;"><br></div><div style=3D"caret-color: rgb(0, 0, 0);=
 color: rgb(0, 0, 0); font-family: &quot;Adwaita Sans&quot;; font-style: no=
rmal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: nor=
mal; word-spacing: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.4); -w=
ebkit-text-stroke-width: 0px; text-decoration: none;"><div><span style=3D"f=
ont-family: &quot;Times New Roman&quot;; font-size: 16.16px; font-variant-l=
igatures: normal; orphans: 2; widows: 2; text-decoration-thickness: initial=
; text-decoration-style: initial; text-decoration-color: initial;">Best,</s=
pan></div><div><span style=3D"font-family: &quot;Times New Roman&quot;; fon=
t-size: 16.16px; font-variant-ligatures: normal; orphans: 2; widows: 2; tex=
t-decoration-thickness: initial; text-decoration-style: initial; text-decor=
ation-color: initial;"><br></span></div><div><span style=3D"font-family: &q=
uot;Times New Roman&quot;; font-size: 16.16px; font-variant-ligatures: norm=
al; orphans: 2; widows: 2; text-decoration-thickness: initial; text-decorat=
ion-style: initial; text-decoration-color: initial;">Mark Filion, on behalf=
 of the X.Org elections committee</span></div></div><div style=3D"caret-col=
or: rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: &quot;Adwaita Sans&quot=
;; font-style: normal; font-variant-caps: normal; font-weight: 400; letter-=
spacing: normal; text-align: start; text-indent: 0px; text-transform: none;=
 white-space: normal; word-spacing: 0px; -webkit-tap-highlight-color: rgba(=
0, 0, 0, 0.4); -webkit-text-stroke-width: 0px; text-decoration: none;"><br>=
</div><div style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-fa=
mily: &quot;Adwaita Sans&quot;; font-style: normal; font-variant-caps: norm=
al; font-weight: 400; letter-spacing: normal; text-align: start; text-inden=
t: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webk=
it-tap-highlight-color: rgba(0, 0, 0, 0.4); -webkit-text-stroke-width: 0px;=
 text-decoration: none;">----</div><div style=3D"caret-color: rgb(0, 0, 0);=
 color: rgb(0, 0, 0); font-family: &quot;Adwaita Sans&quot;; font-style: no=
rmal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: nor=
mal; word-spacing: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.4); -w=
ebkit-text-stroke-width: 0px; text-decoration: none;"><br></div><div style=
=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: &quot;Adwa=
ita Sans&quot;; font-style: normal; font-variant-caps: normal; font-weight:=
 400; letter-spacing: normal; text-align: start; text-indent: 0px; text-tra=
nsform: none; white-space: normal; word-spacing: 0px; -webkit-tap-highlight=
-color: rgba(0, 0, 0, 0.4); -webkit-text-stroke-width: 0px; text-decoration=
: none;"><b><font size=3D"5">Nominees (in alphabetical order)</font></b></d=
iv><div style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-famil=
y: &quot;Adwaita Sans&quot;; font-style: normal; font-variant-caps: normal;=
 font-weight: 400; letter-spacing: normal; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-=
tap-highlight-color: rgba(0, 0, 0, 0.4); -webkit-text-stroke-width: 0px; te=
xt-decoration: none;"><b><br></b></div><div style=3D"caret-color: rgb(0, 0,=
 0); color: rgb(0, 0, 0); font-family: &quot;Adwaita Sans&quot;; font-style=
: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: norm=
al; text-align: start; text-indent: 0px; text-transform: none; white-space:=
 normal; word-spacing: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.4)=
; -webkit-text-stroke-width: 0px; text-decoration: none;"><b><font size=3D"=
4">Andres Gomez</font></b></div><div style=3D"caret-color: rgb(0, 0, 0); co=
lor: rgb(0, 0, 0); font-family: &quot;Adwaita Sans&quot;; font-style: norma=
l; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; tex=
t-align: start; text-indent: 0px; text-transform: none; white-space: normal=
; word-spacing: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.4); -webk=
it-text-stroke-width: 0px; text-decoration: none;">Current Affiliation: Iga=
lia</div><div style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font=
-family: &quot;Adwaita Sans&quot;; font-style: normal; font-variant-caps: n=
ormal; font-weight: 400; letter-spacing: normal; text-align: start; text-in=
dent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -w=
ebkit-tap-highlight-color: rgba(0, 0, 0, 0.4); -webkit-text-stroke-width: 0=
px; text-decoration: none;"><br></div><div style=3D"caret-color: rgb(0, 0, =
0); color: rgb(0, 0, 0); font-family: &quot;Adwaita Sans&quot;; font-style:=
 normal; font-variant-caps: normal; font-weight: 400; letter-spacing: norma=
l; text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.4);=
 -webkit-text-stroke-width: 0px; text-decoration: none;">Personal Statement=
:</div><div style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-f=
amily: &quot;Adwaita Sans&quot;; font-style: normal; font-variant-caps: nor=
mal; font-weight: 400; letter-spacing: normal; text-align: start; text-inde=
nt: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -web=
kit-tap-highlight-color: rgba(0, 0, 0, 0.4); -webkit-text-stroke-width: 0px=
; text-decoration: none;"><br></div><div style=3D"caret-color: rgb(0, 0, 0)=
; color: rgb(0, 0, 0); font-family: &quot;Adwaita Sans&quot;; font-style: n=
ormal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal;=
 text-align: start; text-indent: 0px; text-transform: none; white-space: no=
rmal; word-spacing: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.4); -=
webkit-text-stroke-width: 0px; text-decoration: none;">I have been an activ=
e Open Source contributor since 2003, participating in projects like GNOME,=
 and FreeDesktop, among others. I started to be actively involved with OSS =
graphic drivers in 2014, where I continue devoting much of my time, althoug=
h from a coordination perspective for our team of developers at Igalia.</di=
v><div style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-family=
: &quot;Adwaita Sans&quot;; font-style: normal; font-variant-caps: normal; =
font-weight: 400; letter-spacing: normal; text-align: start; text-indent: 0=
px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-t=
ap-highlight-color: rgba(0, 0, 0, 0.4); -webkit-text-stroke-width: 0px; tex=
t-decoration: none;"><br></div><div style=3D"caret-color: rgb(0, 0, 0); col=
or: rgb(0, 0, 0); font-family: &quot;Adwaita Sans&quot;; font-style: normal=
; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; text=
-align: start; text-indent: 0px; text-transform: none; white-space: normal;=
 word-spacing: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.4); -webki=
t-text-stroke-width: 0px; text-decoration: none;">By joining X.Org board I =
hope to give a bit more back to the community, helping to get things done. =
Among other things, I've contributed to create the graphic design for the p=
ublic image of some past OSS events. I'll be happy to work in other tasks, =
including the organization of XDC. I could take part in the CfP committee, =
for example, or anything else the board could need help with.</div><div sty=
le=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: &quot;Ad=
waita Sans&quot;; font-style: normal; font-variant-caps: normal; font-weigh=
t: 400; letter-spacing: normal; text-align: start; text-indent: 0px; text-t=
ransform: none; white-space: normal; word-spacing: 0px; -webkit-tap-highlig=
ht-color: rgba(0, 0, 0, 0.4); -webkit-text-stroke-width: 0px; text-decorati=
on: none;"><br></div><div style=3D"caret-color: rgb(0, 0, 0); color: rgb(0,=
 0, 0); font-family: &quot;Adwaita Sans&quot;; font-style: normal; font-var=
iant-caps: normal; font-weight: 400; letter-spacing: normal; text-align: st=
art; text-indent: 0px; text-transform: none; white-space: normal; word-spac=
ing: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.4); -webkit-text-str=
oke-width: 0px; text-decoration: none;"><b><font size=3D"4">Arkadiusz Hiler=
</font></b></div><div style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, =
0); font-family: &quot;Adwaita Sans&quot;; font-style: normal; font-variant=
-caps: normal; font-weight: 400; letter-spacing: normal; text-align: start;=
 text-indent: 0px; text-transform: none; white-space: normal; word-spacing:=
 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.4); -webkit-text-stroke-=
width: 0px; text-decoration: none;">Current Affiliation: CodeWeavers</div><=
div style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: &=
quot;Adwaita Sans&quot;; font-style: normal; font-variant-caps: normal; fon=
t-weight: 400; letter-spacing: normal; text-align: start; text-indent: 0px;=
 text-transform: none; white-space: normal; word-spacing: 0px; -webkit-tap-=
highlight-color: rgba(0, 0, 0, 0.4); -webkit-text-stroke-width: 0px; text-d=
ecoration: none;"><br></div><div style=3D"caret-color: rgb(0, 0, 0); color:=
 rgb(0, 0, 0); font-family: &quot;Adwaita Sans&quot;; font-style: normal; f=
ont-variant-caps: normal; font-weight: 400; letter-spacing: normal; text-al=
ign: start; text-indent: 0px; text-transform: none; white-space: normal; wo=
rd-spacing: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.4); -webkit-t=
ext-stroke-width: 0px; text-decoration: none;">Personal Statement:</div><di=
v style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: &qu=
ot;Adwaita Sans&quot;; font-style: normal; font-variant-caps: normal; font-=
weight: 400; letter-spacing: normal; text-align: start; text-indent: 0px; t=
ext-transform: none; white-space: normal; word-spacing: 0px; -webkit-tap-hi=
ghlight-color: rgba(0, 0, 0, 0.4); -webkit-text-stroke-width: 0px; text-dec=
oration: none;"><br></div><div style=3D"caret-color: rgb(0, 0, 0); color: r=
gb(0, 0, 0); font-family: &quot;Adwaita Sans&quot;; font-style: normal; fon=
t-variant-caps: normal; font-weight: 400; letter-spacing: normal; text-alig=
n: start; text-indent: 0px; text-transform: none; white-space: normal; word=
-spacing: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.4); -webkit-tex=
t-stroke-width: 0px; text-decoration: none;">Gaming on Linux is one of the =
main driving forces for the development of a lot of the technologies under =
the X.Org umbrella. I would like to represent the gaming part of the user s=
pace.</div><div style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); fo=
nt-family: &quot;Adwaita Sans&quot;; font-style: normal; font-variant-caps:=
 normal; font-weight: 400; letter-spacing: normal; text-align: start; text-=
indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-tap-highlight-color: rgba(0, 0, 0, 0.4); -webkit-text-stroke-width:=
 0px; text-decoration: none;"><br></div><div style=3D"caret-color: rgb(0, 0=
, 0); color: rgb(0, 0, 0); font-family: &quot;Adwaita Sans&quot;; font-styl=
e: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: nor=
mal; text-align: start; text-indent: 0px; text-transform: none; white-space=
: normal; word-spacing: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.4=
); -webkit-text-stroke-width: 0px; text-decoration: none;">During my 2 year=
s on the board I've helped with finances and planning for the freedesktop.o=
rg migration, assuring that it's sustainable.</div><div style=3D"caret-colo=
r: rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: &quot;Adwaita Sans&quot;=
; font-style: normal; font-variant-caps: normal; font-weight: 400; letter-s=
pacing: normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-tap-highlight-color: rgba(0=
, 0, 0, 0.4); -webkit-text-stroke-width: 0px; text-decoration: none;"><br><=
/div><div style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-fam=
ily: &quot;Adwaita Sans&quot;; font-style: normal; font-variant-caps: norma=
l; font-weight: 400; letter-spacing: normal; text-align: start; text-indent=
: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webki=
t-tap-highlight-color: rgba(0, 0, 0, 0.4); -webkit-text-stroke-width: 0px; =
text-decoration: none;">I also have experience with running conferences and=
 I'm more than happy to help any future XDC organizers on the ground and wi=
th streaming the events.</div><div style=3D"caret-color: rgb(0, 0, 0); colo=
r: rgb(0, 0, 0); font-family: &quot;Adwaita Sans&quot;; font-style: normal;=
 font-variant-caps: normal; font-weight: 400; letter-spacing: normal; text-=
align: start; text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.4); -webkit=
-text-stroke-width: 0px; text-decoration: none;"><br></div><div style=3D"ca=
ret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: &quot;Adwaita Sa=
ns&quot;; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; text-align: start; text-indent: 0px; text-transform=
: none; white-space: normal; word-spacing: 0px; -webkit-tap-highlight-color=
: rgba(0, 0, 0, 0.4); -webkit-text-stroke-width: 0px; text-decoration: none=
;"><b><font size=3D"4">Megan Knight</font></b></div><div style=3D"caret-col=
or: rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: &quot;Adwaita Sans&quot=
;; font-style: normal; font-variant-caps: normal; font-weight: 400; letter-=
spacing: normal; text-align: start; text-indent: 0px; text-transform: none;=
 white-space: normal; word-spacing: 0px; -webkit-tap-highlight-color: rgba(=
0, 0, 0, 0.4); -webkit-text-stroke-width: 0px; text-decoration: none;">Curr=
ent Affiliation: Director of Software Communities, Arm</div><div style=3D"c=
aret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: &quot;Adwaita S=
ans&quot;; font-style: normal; font-variant-caps: normal; font-weight: 400;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-tap-highlight-colo=
r: rgba(0, 0, 0, 0.4); -webkit-text-stroke-width: 0px; text-decoration: non=
e;"><br></div><div style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);=
 font-family: &quot;Adwaita Sans&quot;; font-style: normal; font-variant-ca=
ps: normal; font-weight: 400; letter-spacing: normal; text-align: start; te=
xt-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0p=
x; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.4); -webkit-text-stroke-wid=
th: 0px; text-decoration: none;">Personal Statement:</div><div style=3D"car=
et-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: &quot;Adwaita San=
s&quot;; font-style: normal; font-variant-caps: normal; font-weight: 400; l=
etter-spacing: normal; text-align: start; text-indent: 0px; text-transform:=
 none; white-space: normal; word-spacing: 0px; -webkit-tap-highlight-color:=
 rgba(0, 0, 0, 0.4); -webkit-text-stroke-width: 0px; text-decoration: none;=
"><br></div><div style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); f=
ont-family: &quot;Adwaita Sans&quot;; font-style: normal; font-variant-caps=
: normal; font-weight: 400; letter-spacing: normal; text-align: start; text=
-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px;=
 -webkit-tap-highlight-color: rgba(0, 0, 0, 0.4); -webkit-text-stroke-width=
: 0px; text-decoration: none;">I am very new to the X.Org community, but ea=
ger to help out! I=E2=80=99ve been in open source for over a decade and hav=
e extensive experience planning large scale OS events, engaging with commun=
ities, delivering on Advocacy initiatives and being the translator between =
technical and business decision makers. Currently, I am working on a propos=
al to organize the upcoming 2026 edition of XDC and alsop plan to attend XD=
C 2025.</div><div style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); =
font-family: &quot;Adwaita Sans&quot;; font-style: normal; font-variant-cap=
s: normal; font-weight: 400; letter-spacing: normal; text-align: start; tex=
t-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px=
; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.4); -webkit-text-stroke-widt=
h: 0px; text-decoration: none;"><br></div><div style=3D"caret-color: rgb(0,=
 0, 0); color: rgb(0, 0, 0); font-family: &quot;Adwaita Sans&quot;; font-st=
yle: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: n=
ormal; text-align: start; text-indent: 0px; text-transform: none; white-spa=
ce: normal; word-spacing: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0=
.4); -webkit-text-stroke-width: 0px; text-decoration: none;">I currently se=
rve as the Advocacy Chair for Yocto Project and in the last four years have=
 improved developer relations, improved documentation and onboarding proces=
ses, increased their website SEO, migrated/redesigned their website to incr=
ease traffic, produce(d) 5+ events a year from start to finish, and increas=
ed revenue by attracting new members/upleveling existing members.</div><div=
 style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: &quo=
t;Adwaita Sans&quot;; font-style: normal; font-variant-caps: normal; font-w=
eight: 400; letter-spacing: normal; text-align: start; text-indent: 0px; te=
xt-transform: none; white-space: normal; word-spacing: 0px; -webkit-tap-hig=
hlight-color: rgba(0, 0, 0, 0.4); -webkit-text-stroke-width: 0px; text-deco=
ration: none;"><br></div><div style=3D"caret-color: rgb(0, 0, 0); color: rg=
b(0, 0, 0); font-family: &quot;Adwaita Sans&quot;; font-style: normal; font=
-variant-caps: normal; font-weight: 400; letter-spacing: normal; text-align=
: start; text-indent: 0px; text-transform: none; white-space: normal; word-=
spacing: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.4); -webkit-text=
-stroke-width: 0px; text-decoration: none;">If elected, I look forward to d=
iving deep into X.Org and will apply these skills so developers can focus o=
n building great tech.</div><div style=3D"caret-color: rgb(0, 0, 0); color:=
 rgb(0, 0, 0); font-family: &quot;Adwaita Sans&quot;; font-style: normal; f=
ont-variant-caps: normal; font-weight: 400; letter-spacing: normal; text-al=
ign: start; text-indent: 0px; text-transform: none; white-space: normal; wo=
rd-spacing: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.4); -webkit-t=
ext-stroke-width: 0px; text-decoration: none;"><br></div><div style=3D"care=
t-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: &quot;Adwaita Sans=
&quot;; font-style: normal; font-variant-caps: normal; font-weight: 400; le=
tter-spacing: normal; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; word-spacing: 0px; -webkit-tap-highlight-color: =
rgba(0, 0, 0, 0.4); -webkit-text-stroke-width: 0px; text-decoration: none;"=
><b><font size=3D"4">Lyude Paul</font></b></div><div style=3D"caret-color: =
rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: &quot;Adwaita Sans&quot;; f=
ont-style: normal; font-variant-caps: normal; font-weight: 400; letter-spac=
ing: normal; text-align: start; text-indent: 0px; text-transform: none; whi=
te-space: normal; word-spacing: 0px; -webkit-tap-highlight-color: rgba(0, 0=
, 0, 0.4); -webkit-text-stroke-width: 0px; text-decoration: none;">Current =
Affiliation: Red Hat</div><div style=3D"caret-color: rgb(0, 0, 0); color: r=
gb(0, 0, 0); font-family: &quot;Adwaita Sans&quot;; font-style: normal; fon=
t-variant-caps: normal; font-weight: 400; letter-spacing: normal; text-alig=
n: start; text-indent: 0px; text-transform: none; white-space: normal; word=
-spacing: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.4); -webkit-tex=
t-stroke-width: 0px; text-decoration: none;"><br></div><div style=3D"caret-=
color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: &quot;Adwaita Sans&q=
uot;; font-style: normal; font-variant-caps: normal; font-weight: 400; lett=
er-spacing: normal; text-align: start; text-indent: 0px; text-transform: no=
ne; white-space: normal; word-spacing: 0px; -webkit-tap-highlight-color: rg=
ba(0, 0, 0, 0.4); -webkit-text-stroke-width: 0px; text-decoration: none;">P=
ersonal Statement:</div><div style=3D"caret-color: rgb(0, 0, 0); color: rgb=
(0, 0, 0); font-family: &quot;Adwaita Sans&quot;; font-style: normal; font-=
variant-caps: normal; font-weight: 400; letter-spacing: normal; text-align:=
 start; text-indent: 0px; text-transform: none; white-space: normal; word-s=
pacing: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.4); -webkit-text-=
stroke-width: 0px; text-decoration: none;"><br></div><div style=3D"caret-co=
lor: rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: &quot;Adwaita Sans&quo=
t;; font-style: normal; font-variant-caps: normal; font-weight: 400; letter=
-spacing: normal; text-align: start; text-indent: 0px; text-transform: none=
; white-space: normal; word-spacing: 0px; -webkit-tap-highlight-color: rgba=
(0, 0, 0, 0.4); -webkit-text-stroke-width: 0px; text-decoration: none;">Hi!=
 My name is Lyude Paul, and I'm currently employed at Red Hat as a Software=
 Engineer. I'm also currently on the X.org Board of Directors as X.org's Se=
cretary, and am also a member of the CoC team. I've also been a member of X=
.org for multiple years now and have contributed to a plethora of various p=
rojects in the X.org/freedesktop.org/linux kernel space such as: nova, nouv=
eau, i915, amdgpu, the wayland protocol, igt-gpu-tools, libinput, and more.=
</div><div style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-fa=
mily: &quot;Adwaita Sans&quot;; font-style: normal; font-variant-caps: norm=
al; font-weight: 400; letter-spacing: normal; text-align: start; text-inden=
t: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webk=
it-tap-highlight-color: rgba(0, 0, 0, 0.4); -webkit-text-stroke-width: 0px;=
 text-decoration: none;"><br></div><div style=3D"caret-color: rgb(0, 0, 0);=
 color: rgb(0, 0, 0); font-family: &quot;Adwaita Sans&quot;; font-style: no=
rmal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: nor=
mal; word-spacing: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.4); -w=
ebkit-text-stroke-width: 0px; text-decoration: none;">I've had a pretty lon=
g tenure on the board where I've accomplished a number of cool things For i=
nstance, I restarted X.org's relationship with VESA in order to give X.org =
members access to various VESA specifications that they might not have acce=
ss to otherwise without a prior VESA membership. I worked to help enable X.=
og to provide funding for professional CoC training for any X.org/freeeskto=
p.org project that requests it, and I've assisted through the transition of=
 parent foundations for X.org from SPI to SFC. I love working in this commu=
nity, and will do my best to serve the community throughout my tenusre if r=
e-elected to the board of directors.</div><div style=3D"caret-color: rgb(0,=
 0, 0); color: rgb(0, 0, 0); font-family: &quot;Adwaita Sans&quot;; font-st=
yle: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: n=
ormal; text-align: start; text-indent: 0px; text-transform: none; white-spa=
ce: normal; word-spacing: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0=
.4); -webkit-text-stroke-width: 0px; text-decoration: none;"><br></div><div=
 style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: &quo=
t;Adwaita Sans&quot;; font-style: normal; font-variant-caps: normal; font-w=
eight: 400; letter-spacing: normal; text-align: start; text-indent: 0px; te=
xt-transform: none; white-space: normal; word-spacing: 0px; -webkit-tap-hig=
hlight-color: rgba(0, 0, 0, 0.4); -webkit-text-stroke-width: 0px; text-deco=
ration: none;"><b><font size=3D"4">Harry Wentland</font></b></div><div styl=
e=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: &quot;Adw=
aita Sans&quot;; font-style: normal; font-variant-caps: normal; font-weight=
: 400; letter-spacing: normal; text-align: start; text-indent: 0px; text-tr=
ansform: none; white-space: normal; word-spacing: 0px; -webkit-tap-highligh=
t-color: rgba(0, 0, 0, 0.4); -webkit-text-stroke-width: 0px; text-decoratio=
n: none;">Current Affiliation: AMD</div><div style=3D"caret-color: rgb(0, 0=
, 0); color: rgb(0, 0, 0); font-family: &quot;Adwaita Sans&quot;; font-styl=
e: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: nor=
mal; text-align: start; text-indent: 0px; text-transform: none; white-space=
: normal; word-spacing: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.4=
); -webkit-text-stroke-width: 0px; text-decoration: none;"><br></div><div s=
tyle=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: &quot;=
Adwaita Sans&quot;; font-style: normal; font-variant-caps: normal; font-wei=
ght: 400; letter-spacing: normal; text-align: start; text-indent: 0px; text=
-transform: none; white-space: normal; word-spacing: 0px; -webkit-tap-highl=
ight-color: rgba(0, 0, 0, 0.4); -webkit-text-stroke-width: 0px; text-decora=
tion: none;">Personal Statement:</div><div style=3D"caret-color: rgb(0, 0, =
0); color: rgb(0, 0, 0); font-family: &quot;Adwaita Sans&quot;; font-style:=
 normal; font-variant-caps: normal; font-weight: 400; letter-spacing: norma=
l; text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.4);=
 -webkit-text-stroke-width: 0px; text-decoration: none;"><br></div><div sty=
le=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: &quot;Ad=
waita Sans&quot;; font-style: normal; font-variant-caps: normal; font-weigh=
t: 400; letter-spacing: normal; text-align: start; text-indent: 0px; text-t=
ransform: none; white-space: normal; word-spacing: 0px; -webkit-tap-highlig=
ht-color: rgba(0, 0, 0, 0.4); -webkit-text-stroke-width: 0px; text-decorati=
on: none;">I've been lucky to be paid to help improve the Linux Desktop exp=
erience on AMD HW and in that capacity align with X.Org's mission to furthe=
r the state of the open-source desktop. A healthy, diverse, open-source, an=
d general-purpose desktop provides tremendous value to many people and is a=
 bulwark against corporate silos.</div><div style=3D"caret-color: rgb(0, 0,=
 0); color: rgb(0, 0, 0); font-family: &quot;Adwaita Sans&quot;; font-style=
: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: norm=
al; text-align: start; text-indent: 0px; text-transform: none; white-space:=
 normal; word-spacing: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.4)=
; -webkit-text-stroke-width: 0px; text-decoration: none;"><br></div><div st=
yle=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: &quot;A=
dwaita Sans&quot;; font-style: normal; font-variant-caps: normal; font-weig=
ht: 400; letter-spacing: normal; text-align: start; text-indent: 0px; text-=
transform: none; white-space: normal; word-spacing: 0px; -webkit-tap-highli=
ght-color: rgba(0, 0, 0, 0.4); -webkit-text-stroke-width: 0px; text-decorat=
ion: none;">I've also been lucky to have previously served on X.Org's Board=
 of Directors. If I am elected I am happy to support the board wherever nee=
ded, whether in supporting infrastructure, chasing sponsors, or organizing =
the conference.</div><div style=3D"caret-color: rgb(0, 0, 0); color: rgb(0,=
 0, 0); font-family: &quot;Adwaita Sans&quot;; font-style: normal; font-var=
iant-caps: normal; font-weight: 400; letter-spacing: normal; text-align: st=
art; text-indent: 0px; text-transform: none; white-space: normal; word-spac=
ing: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.4); -webkit-text-str=
oke-width: 0px; text-decoration: none;"><br></div><div style=3D"caret-color=
: rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: &quot;Adwaita Sans&quot;;=
 font-style: normal; font-variant-caps: normal; font-weight: 400; letter-sp=
acing: normal; text-align: start; text-indent: 0px; text-transform: none; w=
hite-space: normal; word-spacing: 0px; -webkit-tap-highlight-color: rgba(0,=
 0, 0, 0.4); -webkit-text-stroke-width: 0px; text-decoration: none;">Statem=
ent of Contribution:</div><div style=3D"caret-color: rgb(0, 0, 0); color: r=
gb(0, 0, 0); font-family: &quot;Adwaita Sans&quot;; font-style: normal; fon=
t-variant-caps: normal; font-weight: 400; letter-spacing: normal; text-alig=
n: start; text-indent: 0px; text-transform: none; white-space: normal; word=
-spacing: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.4); -webkit-tex=
t-stroke-width: 0px; text-decoration: none;"><br></div><div style=3D"caret-=
color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: &quot;Adwaita Sans&q=
uot;; font-style: normal; font-variant-caps: normal; font-weight: 400; lett=
er-spacing: normal; text-align: start; text-indent: 0px; text-transform: no=
ne; white-space: normal; word-spacing: 0px; -webkit-tap-highlight-color: rg=
ba(0, 0, 0, 0.4); -webkit-text-stroke-width: 0px; text-decoration: none;">I=
 maintain AMD's DRM/KMS driver and have lately been exploring beyond that. =
I have also recently found myself helping to drive the color/HDR effort for=
ward in small ways.</div><div><span></span></div></body></html>

--=-AShNssFFTafBdHANIKXp--
