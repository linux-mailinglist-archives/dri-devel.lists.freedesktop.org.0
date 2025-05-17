Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8E4ABA931
	for <lists+dri-devel@lfdr.de>; Sat, 17 May 2025 11:44:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AEAE10E242;
	Sat, 17 May 2025 09:44:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=mark.filion@collabora.com header.b="Lvm3OhZm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o16.zoho.com (sender4-op-o16.zoho.com
 [136.143.188.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5760810E182
 for <dri-devel@lists.freedesktop.org>; Sat, 17 May 2025 09:44:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1747475095; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=E3hsNnMirw24IYSxZEfdsmVbo2bW+dMUC/egdw8wM+RP0MMHD2YmOcNu3MTXvS3KTvkEPzmdC2YJKDG0pQo+HBwql1PXee3Lsd/FUHkzw7zkmK1IvQyFwtV8rGiaiMfZ/lpmiFWP3VrE5pnftJwgx5CueyQypPlS9ROkV1lkXDo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1747475095;
 h=Content-Type:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc;
 bh=p71+aGQRV9aorniQkc4/bt8eyHFDYZ85ArQzwy0CCxo=; 
 b=Ic0qPHzTuAjKjLP7IQA2+5Cq/0a9D1HIp1Bsbd/Uf6zI3ERbhQnb9JLhGXX/BFRsWxBExhbme9aCv5z5Z0u6eNYzhaR8lA0B/WLGVlNZr/Gr2AwXg5RK6AnQF4MlteAwkhr4fzwnTh1Np1knWtZ+OyGNUoYylWNtyDe6cTJdp2g=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=mark.filion@collabora.com;
 dmarc=pass header.from=<mark.filion@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747475095; 
 s=zohomail; d=collabora.com; i=mark.filion@collabora.com;
 h=Message-ID:Subject:Subject:From:From:To:To:Date:Date:Content-Type:MIME-Version:Message-Id:Reply-To:Cc;
 bh=p71+aGQRV9aorniQkc4/bt8eyHFDYZ85ArQzwy0CCxo=;
 b=Lvm3OhZmNapiDD90l4fT/q3MJXoHl90Ry0SUT69dXATeTpC7do+u1zNGiblc8cCG
 XrOowdtWRYxRe6ehOd2dJL1AhqhQGn10Rx/nC6brgieJ3XcoRwwVWbumPreWmtcpmE0
 B6wUWKYvL+fot5ifUbiTOfXIxhDdYM0Rmd6LK4dc=
Received: by mx.zohomail.com with SMTPS id 1747475093043820.3820028333478;
 Sat, 17 May 2025 02:44:53 -0700 (PDT)
Message-ID: <32754e8e93f986f41c5eec63815d3821a1b56525.camel@collabora.com>
Subject: 2025 X.Org Foundation Election results
From: Mark Filion <mark.filion@collabora.com>
To: dri-devel@lists.freedesktop.org
Date: Sat, 17 May 2025 11:44:48 +0200
Content-Type: multipart/alternative; boundary="=-VyRgG4u/MrWhNJhqpict"
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

--=-VyRgG4u/MrWhNJhqpict
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello all,

The Board of Directors election concluded at 23:59 UTC on 14 May 2025.
For this election, we had 77 members who could cast a vote. 72 did, so
the turnout was 92.5%. This is the 3rd highest turnout in the last 10
elections, with only 2021 (93.8%) and 2016 (98.8%) being higher. It is
also a 147% increase from last year's turnout (62.9%). Thank you to
everyone who took the time to vote!

In the election of the Directors to the Board of the X.Org Foundation,
the results were that Lyude Paul, Andres Gomez, Arkadiusz Hiler and
Harry Wentland were elected for two year terms.

The old full board is: Erik Faye-Lund, Mark Filion, Neal Gompa,
Arkadiusz Hiler, Christopher Michael, Lyude Paul, and Simon Ser.

The new full board is: Erik Faye-Lund, Mark Filion, Andres Gomez, Neal
Gompa, Arkadiusz Hiler, Lyude Paul, Simon Ser, and Harry Wentland.

Mark Filion, on behalf of the X.Org elections committee

--=-VyRgG4u/MrWhNJhqpict
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
oke-width: 0px; text-decoration: none;">Hello all,</div><div style=3D"caret=
-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: &quot;Adwaita Sans&=
quot;; font-style: normal; font-variant-caps: normal; font-weight: 400; let=
ter-spacing: normal; text-align: start; text-indent: 0px; text-transform: n=
one; white-space: normal; word-spacing: 0px; -webkit-tap-highlight-color: r=
gba(0, 0, 0, 0.4); -webkit-text-stroke-width: 0px; text-decoration: none;">=
<br></div><div style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); fon=
t-family: &quot;Adwaita Sans&quot;; font-style: normal; font-variant-caps: =
normal; font-weight: 400; letter-spacing: normal; text-align: start; text-i=
ndent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -=
webkit-tap-highlight-color: rgba(0, 0, 0, 0.4); -webkit-text-stroke-width: =
0px; text-decoration: none;">The Board of Directors election concluded at 2=
3:59 UTC on 14 May 2025. For this election, we had 77 members who could cas=
t a vote. 72 did, so the turnout was 92.5%. This is the 3rd highest turnout=
 in the last 10 elections, with only 2021 (93.8%) and 2016 (98.8%) being hi=
gher. It is also a 147% increase from last year's turnout (62.9%). Thank yo=
u to everyone who took the time to vote!</div><div style=3D"caret-color: rg=
b(0, 0, 0); color: rgb(0, 0, 0); font-family: &quot;Adwaita Sans&quot;; fon=
t-style: normal; font-variant-caps: normal; font-weight: 400; letter-spacin=
g: normal; text-align: start; text-indent: 0px; text-transform: none; white=
-space: normal; word-spacing: 0px; -webkit-tap-highlight-color: rgba(0, 0, =
0, 0.4); -webkit-text-stroke-width: 0px; text-decoration: none;"><br></div>=
<div style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: =
&quot;Adwaita Sans&quot;; font-style: normal; font-variant-caps: normal; fo=
nt-weight: 400; letter-spacing: normal; text-align: start; text-indent: 0px=
; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-tap=
-highlight-color: rgba(0, 0, 0, 0.4); -webkit-text-stroke-width: 0px; text-=
decoration: none;">In the election of the Directors to the Board of the X.O=
rg Foundation, the results were that Lyude Paul, Andres Gomez, Arkadiusz Hi=
ler and Harry Wentland were elected for two year terms.</div><div style=3D"=
caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: &quot;Adwaita =
Sans&quot;; font-style: normal; font-variant-caps: normal; font-weight: 400=
; letter-spacing: normal; text-align: start; text-indent: 0px; text-transfo=
rm: none; white-space: normal; word-spacing: 0px; -webkit-tap-highlight-col=
or: rgba(0, 0, 0, 0.4); -webkit-text-stroke-width: 0px; text-decoration: no=
ne;"><br></div><div style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0)=
; font-family: &quot;Adwaita Sans&quot;; font-style: normal; font-variant-c=
aps: normal; font-weight: 400; letter-spacing: normal; text-align: start; t=
ext-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0=
px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.4); -webkit-text-stroke-wi=
dth: 0px; text-decoration: none;">The old full board is: Erik Faye-Lund, Ma=
rk Filion, Neal Gompa, Arkadiusz Hiler, Christopher Michael, Lyude Paul, an=
d Simon Ser.</div><div style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0,=
 0); font-family: &quot;Adwaita Sans&quot;; font-style: normal; font-varian=
t-caps: normal; font-weight: 400; letter-spacing: normal; text-align: start=
; text-indent: 0px; text-transform: none; white-space: normal; word-spacing=
: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.4); -webkit-text-stroke=
-width: 0px; text-decoration: none;"><br></div><div style=3D"caret-color: r=
gb(0, 0, 0); color: rgb(0, 0, 0); font-family: &quot;Adwaita Sans&quot;; fo=
nt-style: normal; font-variant-caps: normal; font-weight: 400; letter-spaci=
ng: normal; text-align: start; text-indent: 0px; text-transform: none; whit=
e-space: normal; word-spacing: 0px; -webkit-tap-highlight-color: rgba(0, 0,=
 0, 0.4); -webkit-text-stroke-width: 0px; text-decoration: none;">The new f=
ull board is: Erik Faye-Lund, Mark Filion, Andres Gomez, Neal Gompa, Arkadi=
usz Hiler, Lyude Paul, Simon Ser, and Harry Wentland.</div><div style=3D"ca=
ret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: &quot;Adwaita Sa=
ns&quot;; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; text-align: start; text-indent: 0px; text-transform=
: none; white-space: normal; word-spacing: 0px; -webkit-tap-highlight-color=
: rgba(0, 0, 0, 0.4); -webkit-text-stroke-width: 0px; text-decoration: none=
;"><br></div><div style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); =
font-family: &quot;Adwaita Sans&quot;; font-style: normal; font-variant-cap=
s: normal; font-weight: 400; letter-spacing: normal; text-align: start; tex=
t-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px=
; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.4); -webkit-text-stroke-widt=
h: 0px; text-decoration: none;">Mark Filion, on behalf of the X.Org electio=
ns committee</div><div><span></span></div></body></html>

--=-VyRgG4u/MrWhNJhqpict--
