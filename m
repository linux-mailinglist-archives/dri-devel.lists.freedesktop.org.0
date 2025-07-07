Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A88AFB67C
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 16:49:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AC2910E4C8;
	Mon,  7 Jul 2025 14:49:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=mark.filion@collabora.com header.b="a+4EMo/R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o16.zoho.com (sender4-op-o16.zoho.com
 [136.143.188.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A55410E4C8
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jul 2025 14:49:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1751899780; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=DqQBhn8DZq6ITXhuv7u23sWQB966dYEc3Av2DgbsiDpWtD3rteklGBJf86qs7ofTCgUDADk08D20V4C3k+3w7qxckBmrmWY6iqJ3pR1b3es7q3jNFMa56pyU7w1Nj+dpZtMvYwOnjBw4KSMoPvpIXgmqJbL2kauxjF3TDPre+pY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1751899780;
 h=Content-Type:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc;
 bh=F7Lc6aGsvFx75qY2m/zGh8c2nz3U6xaLxaa086Uvz5E=; 
 b=cGBma/9hmSVhVghTKONn7Jp3L5BrNqQdx+98OetT1d05YQIok5DdDElNeNdyLhosYSHT2oBufczFL69iDi6P5xmLTmr6GW6OLtMK5D1shcSHA8oVufT7R+kEXw3s1qlvY5Y+3H7UD7ygXtW5bowraoq2T6cdbzz2c91m1f9L8Ow=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=mark.filion@collabora.com;
 dmarc=pass header.from=<mark.filion@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1751899780; 
 s=zohomail; d=collabora.com; i=mark.filion@collabora.com;
 h=Message-ID:Subject:Subject:From:From:To:To:Date:Date:Content-Type:MIME-Version:Message-Id:Reply-To:Cc;
 bh=F7Lc6aGsvFx75qY2m/zGh8c2nz3U6xaLxaa086Uvz5E=;
 b=a+4EMo/Rrx8Zq+OmiIE+qj4aiyggEUNtG4r1nzkeR49qBNsa/QOjfaFQbNoAg1HJ
 JmiA4tDG1bMKruV8bqCPOscib1zRJRBj6PlYHJL0Xw8So7Qc7hjkVFCrNZhLo0BBofe
 Vbv/DSQ0X6mcFYtRkXofJerE0gjtnXAbFxtqyFPA=
Received: by mx.zohomail.com with SMTPS id 1751899778437657.3483337445776;
 Mon, 7 Jul 2025 07:49:38 -0700 (PDT)
Message-ID: <0a136f82954239f0fd8c2924032987ad731bf346.camel@collabora.com>
Subject: Reminder: Final week to submit a talk for XDC 2025!
From: Mark Filion <mark.filion@collabora.com>
To: dri-devel@lists.freedesktop.org
Date: Mon, 07 Jul 2025 10:49:35 -0400
Content-Type: multipart/alternative; boundary="=-zRRrE9Nuaqqi9oUFYtBH"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42app2) 
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

--=-zRRrE9Nuaqqi9oUFYtBH
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello!

It's the final week to submit a talk for XDC 2025, which will
take place at the TU Wien Kuppelsaal in Vienna, Austria on 29
September to 1 October. CfP ends this coming Friday, 11 July at 23:59
CEST.

=C2=A0=C2=A0=C2=A0=C2=A0https://xdc2025.x.org
=C2=A0=C2=A0
As usual, the conference is free of charge and open to the general
public. If you plan on attending, please make sure to register as early
as possible:

=C2=A0=C2=A0=C2=A0=C2=A0https://indico.freedesktop.org/event/10/registratio=
ns/

In addition to registration, the CfP is now open for talks, demos, and
workshops at XDC 2025. While any serious proposal will be gratefully
considered, topics of interest to X.Org and freedesktop.org developers
are encouraged. The program focus is on new development, ongoing
challenges and anything else that will spark discussions among
attendees in the hallway track.

We are open to talks across all layers of the graphics stack, from the
kernel to desktop environments / graphical applications and about how
to make things better for the developers who build them. Head to the
CfP page to learn more:

=C2=A0=C2=A0=C2=A0=C2=A0https://indico.freedesktop.org/event/10/abstracts/

The deadline for submissions Friday, 11 July 2025.

We are looking forward to seeing you in Vienna! If you have any
questions, please email the organizer (hfink at snap.com), adding on
CC the X.org board (board at foundation.x.org).

And don't forget, you can follow us on Mastodon for all the latest
updates and to stay connected:

=C2=A0=C2=A0=C2=A0=C2=A0https://floss.social/@XOrgDevConf

Best,

Mark

--=-zRRrE9Nuaqqi9oUFYtBH
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
oke-width: 0px; text-decoration: none;">H<span style=3D"caret-color: rgb(46=
, 52, 54); color: rgb(46, 52, 54); font-family: &quot;Adwaita Mono&quot;;">=
ello!</span></div><div style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0,=
 0); font-family: &quot;Adwaita Sans&quot;; font-style: normal; font-varian=
t-caps: normal; font-weight: 400; letter-spacing: normal; text-align: start=
; text-indent: 0px; text-transform: none; white-space: normal; word-spacing=
: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.4); -webkit-text-stroke=
-width: 0px; text-decoration: none;"><br style=3D"caret-color: rgb(46, 52, =
54); color: rgb(46, 52, 54); font-family: &quot;Adwaita Mono&quot;;"><span =
style=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 52, 54); font-family:=
 &quot;Adwaita Mono&quot;;">It's the final week to submit a talk for XDC 20=
25, which will</span><br style=3D"caret-color: rgb(46, 52, 54); color: rgb(=
46, 52, 54); font-family: &quot;Adwaita Mono&quot;;"><span style=3D"caret-c=
olor: rgb(46, 52, 54); color: rgb(46, 52, 54); font-family: &quot;Adwaita M=
ono&quot;;">take place at the TU Wien Kuppelsaal in Vienna, Austria on 29</=
span><br style=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 52, 54); fon=
t-family: &quot;Adwaita Mono&quot;;"><span style=3D"caret-color: rgb(46, 52=
, 54); color: rgb(46, 52, 54); font-family: &quot;Adwaita Mono&quot;;">Sept=
ember to 1 October. CfP ends this coming Friday, 11 July at 23:59 CEST.</sp=
an><br style=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 52, 54); font-=
family: &quot;Adwaita Mono&quot;;"><br style=3D"caret-color: rgb(46, 52, 54=
); color: rgb(46, 52, 54); font-family: &quot;Adwaita Mono&quot;;"><span st=
yle=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 52, 54); font-family: &=
quot;Adwaita Mono&quot;;">&nbsp;&nbsp;&nbsp;&nbsp;</span><a href=3D"https:/=
/xdc2025.x.org/" title=3D"Click to open https://xdc2025.x.org/" style=3D"co=
lor: rgb(46, 52, 54); font-family: &quot;Adwaita Mono&quot;;">https://xdc20=
25.x.org</a><br style=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 52, 5=
4); font-family: &quot;Adwaita Mono&quot;;"><span style=3D"caret-color: rgb=
(46, 52, 54); color: rgb(46, 52, 54); font-family: &quot;Adwaita Mono&quot;=
;">&nbsp;&nbsp;</span><br style=3D"caret-color: rgb(46, 52, 54); color: rgb=
(46, 52, 54); font-family: &quot;Adwaita Mono&quot;;"><span style=3D"caret-=
color: rgb(46, 52, 54); color: rgb(46, 52, 54); font-family: &quot;Adwaita =
Mono&quot;;">As usual, the conference is free of charge and open to the gen=
eral</span><br style=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 52, 54=
); font-family: &quot;Adwaita Mono&quot;;"><span style=3D"caret-color: rgb(=
46, 52, 54); color: rgb(46, 52, 54); font-family: &quot;Adwaita Mono&quot;;=
">public. If you plan on attending, please make sure to register as early</=
span><br style=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 52, 54); fon=
t-family: &quot;Adwaita Mono&quot;;"><span style=3D"caret-color: rgb(46, 52=
, 54); color: rgb(46, 52, 54); font-family: &quot;Adwaita Mono&quot;;">as p=
ossible:</span><br style=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 52=
, 54); font-family: &quot;Adwaita Mono&quot;;"><br style=3D"caret-color: rg=
b(46, 52, 54); color: rgb(46, 52, 54); font-family: &quot;Adwaita Mono&quot=
;;"><span style=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 52, 54); fo=
nt-family: &quot;Adwaita Mono&quot;;">&nbsp;&nbsp;&nbsp;&nbsp;</span><a hre=
f=3D"https://indico.freedesktop.org/event/10/registrations/" title=3D"Click=
 to open https://indico.freedesktop.org/event/10/registrations/" style=3D"c=
olor: rgb(46, 52, 54); font-family: &quot;Adwaita Mono&quot;;">https://indi=
co.freedesktop.org/event/10/registrations/</a><br style=3D"caret-color: rgb=
(46, 52, 54); color: rgb(46, 52, 54); font-family: &quot;Adwaita Mono&quot;=
;"><br style=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 52, 54); font-=
family: &quot;Adwaita Mono&quot;;"><span style=3D"caret-color: rgb(46, 52, =
54); color: rgb(46, 52, 54); font-family: &quot;Adwaita Mono&quot;;">In add=
ition to registration, the CfP is now open for talks, demos, and</span><br =
style=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 52, 54); font-family:=
 &quot;Adwaita Mono&quot;;"><span style=3D"caret-color: rgb(46, 52, 54); co=
lor: rgb(46, 52, 54); font-family: &quot;Adwaita Mono&quot;;">workshops at =
XDC 2025. While any serious proposal will be gratefully</span><br style=3D"=
caret-color: rgb(46, 52, 54); color: rgb(46, 52, 54); font-family: &quot;Ad=
waita Mono&quot;;"><span style=3D"caret-color: rgb(46, 52, 54); color: rgb(=
46, 52, 54); font-family: &quot;Adwaita Mono&quot;;">considered, topics of =
interest to X.Org and freedesktop.org developers</span><br style=3D"caret-c=
olor: rgb(46, 52, 54); color: rgb(46, 52, 54); font-family: &quot;Adwaita M=
ono&quot;;"><span style=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 52,=
 54); font-family: &quot;Adwaita Mono&quot;;">are encouraged. The program f=
ocus is on new development, ongoing</span><br style=3D"caret-color: rgb(46,=
 52, 54); color: rgb(46, 52, 54); font-family: &quot;Adwaita Mono&quot;;"><=
span style=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 52, 54); font-fa=
mily: &quot;Adwaita Mono&quot;;">challenges and anything else that will spa=
rk discussions among</span><br style=3D"caret-color: rgb(46, 52, 54); color=
: rgb(46, 52, 54); font-family: &quot;Adwaita Mono&quot;;"><span style=3D"c=
aret-color: rgb(46, 52, 54); color: rgb(46, 52, 54); font-family: &quot;Adw=
aita Mono&quot;;">attendees in the hallway track.</span><br style=3D"caret-=
color: rgb(46, 52, 54); color: rgb(46, 52, 54); font-family: &quot;Adwaita =
Mono&quot;;"><br style=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 52, =
54); font-family: &quot;Adwaita Mono&quot;;"><span style=3D"caret-color: rg=
b(46, 52, 54); color: rgb(46, 52, 54); font-family: &quot;Adwaita Mono&quot=
;;">We are open to talks across all layers of the graphics stack, from the<=
/span><br style=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 52, 54); fo=
nt-family: &quot;Adwaita Mono&quot;;"><span style=3D"caret-color: rgb(46, 5=
2, 54); color: rgb(46, 52, 54); font-family: &quot;Adwaita Mono&quot;;">ker=
nel to desktop environments / graphical applications and about how</span><b=
r style=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 52, 54); font-famil=
y: &quot;Adwaita Mono&quot;;"><span style=3D"caret-color: rgb(46, 52, 54); =
color: rgb(46, 52, 54); font-family: &quot;Adwaita Mono&quot;;">to make thi=
ngs better for the developers who build them. Head to the</span><br style=
=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 52, 54); font-family: &quo=
t;Adwaita Mono&quot;;"><span style=3D"caret-color: rgb(46, 52, 54); color: =
rgb(46, 52, 54); font-family: &quot;Adwaita Mono&quot;;">CfP page to learn =
more:</span><br style=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 52, 5=
4); font-family: &quot;Adwaita Mono&quot;;"><br style=3D"caret-color: rgb(4=
6, 52, 54); color: rgb(46, 52, 54); font-family: &quot;Adwaita Mono&quot;;"=
><span style=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 52, 54); font-=
family: &quot;Adwaita Mono&quot;;">&nbsp;&nbsp;&nbsp;&nbsp;</span><a href=
=3D"https://indico.freedesktop.org/event/10/abstracts/" title=3D"Click to o=
pen https://indico.freedesktop.org/event/10/abstracts/" style=3D"color: rgb=
(46, 52, 54); font-family: &quot;Adwaita Mono&quot;;">https://indico.freede=
sktop.org/event/10/abstracts/</a><br style=3D"caret-color: rgb(46, 52, 54);=
 color: rgb(46, 52, 54); font-family: &quot;Adwaita Mono&quot;;"><br style=
=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 52, 54); font-family: &quo=
t;Adwaita Mono&quot;;"><span style=3D"caret-color: rgb(46, 52, 54); color: =
rgb(46, 52, 54); font-family: &quot;Adwaita Mono&quot;;">The deadline for s=
ubmissions Friday, 11 July 2025.</span><br style=3D"caret-color: rgb(46, 52=
, 54); color: rgb(46, 52, 54); font-family: &quot;Adwaita Mono&quot;;"><br =
style=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 52, 54); font-family:=
 &quot;Adwaita Mono&quot;;"><span style=3D"caret-color: rgb(46, 52, 54); co=
lor: rgb(46, 52, 54); font-family: &quot;Adwaita Mono&quot;;">We are lookin=
g forward to seeing you in Vienna! If you have any</span><br style=3D"caret=
-color: rgb(46, 52, 54); color: rgb(46, 52, 54); font-family: &quot;Adwaita=
 Mono&quot;;"><span style=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 5=
2, 54); font-family: &quot;Adwaita Mono&quot;;">questions, please email the=
 organizer (hfink at snap.com), adding on</span><br style=3D"caret-color: r=
gb(46, 52, 54); color: rgb(46, 52, 54); font-family: &quot;Adwaita Mono&quo=
t;;"><span style=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 52, 54); f=
ont-family: &quot;Adwaita Mono&quot;;">CC the X.org board (board at foundat=
ion.x.org).</span><br style=3D"caret-color: rgb(46, 52, 54); color: rgb(46,=
 52, 54); font-family: &quot;Adwaita Mono&quot;;"><br style=3D"caret-color:=
 rgb(46, 52, 54); color: rgb(46, 52, 54); font-family: &quot;Adwaita Mono&q=
uot;;"><span style=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 52, 54);=
 font-family: &quot;Adwaita Mono&quot;;">And don't forget, you can follow u=
s on Mastodon for all the latest</span><br style=3D"caret-color: rgb(46, 52=
, 54); color: rgb(46, 52, 54); font-family: &quot;Adwaita Mono&quot;;"><spa=
n style=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 52, 54); font-famil=
y: &quot;Adwaita Mono&quot;;">updates and to stay connected:</span><br styl=
e=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 52, 54); font-family: &qu=
ot;Adwaita Mono&quot;;"><br style=3D"caret-color: rgb(46, 52, 54); color: r=
gb(46, 52, 54); font-family: &quot;Adwaita Mono&quot;;"><span style=3D"care=
t-color: rgb(46, 52, 54); color: rgb(46, 52, 54); font-family: &quot;Adwait=
a Mono&quot;;">&nbsp;&nbsp;&nbsp;&nbsp;</span><a href=3D"https://floss.soci=
al/@XOrgDevConf" title=3D"Click to open https://floss.social/@XOrgDevConf" =
style=3D"color: rgb(46, 52, 54); font-family: &quot;Adwaita Mono&quot;;">ht=
tps://floss.social/@XOrgDevConf</a><br style=3D"caret-color: rgb(46, 52, 54=
); color: rgb(46, 52, 54); font-family: &quot;Adwaita Mono&quot;;"><br styl=
e=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 52, 54); font-family: &qu=
ot;Adwaita Mono&quot;;"><span style=3D"caret-color: rgb(46, 52, 54); color:=
 rgb(46, 52, 54); font-family: &quot;Adwaita Mono&quot;;">Best,</span><br s=
tyle=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 52, 54); font-family: =
&quot;Adwaita Mono&quot;;"><br style=3D"caret-color: rgb(46, 52, 54); color=
: rgb(46, 52, 54); font-family: &quot;Adwaita Mono&quot;;"><span style=3D"c=
aret-color: rgb(46, 52, 54); color: rgb(46, 52, 54); font-family: &quot;Adw=
aita Mono&quot;;">Mark</span></div><div><span></span></div></body></html>

--=-zRRrE9Nuaqqi9oUFYtBH--
