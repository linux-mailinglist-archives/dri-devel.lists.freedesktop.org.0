Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49DB2B02362
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 20:12:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF43110EAA9;
	Fri, 11 Jul 2025 18:12:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=mark.filion@collabora.com header.b="XodiXbfL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o16.zoho.com (sender4-op-o16.zoho.com
 [136.143.188.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00D3610EAA9
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 18:12:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1752257556; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=CXR7yY+yrZw9FqHZtZT+hVhoSe9po6QrMNX6US3jOvz0rxuJdR6VM0BIJTTXSa88L/mHme9P7M7UasODv/0aJJ7gyRUK1+eefhIqzz2E8I3ScftLlZf6SQDwDi3NPTMetfLGR1jzhC5zFkTZ3VP2n4NMICpS7JoDd6cF8Vo1UKY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1752257556;
 h=Content-Type:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc;
 bh=sDihnr9wPy9i3oazzwGHbCjRXaqhugrQpYLx7o7O9Sc=; 
 b=NjdYe99E9X/KGd2IJXxnxOgt8UQ4cxSoVL/N2C98+nFZYtQEAQvKxCR7zyXLuFt/NNz0yhJ3uaGjdm5QujHGoMaIZZzT0ZpQ8o7l2JZlq6WKeog0U/YyaGkH/1/zQsA7nvafyK7Bpmp1lWW/f7yw70m0DiV4JW/7TWh81BmApcE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=mark.filion@collabora.com;
 dmarc=pass header.from=<mark.filion@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1752257556; 
 s=zohomail; d=collabora.com; i=mark.filion@collabora.com;
 h=Message-ID:Subject:Subject:From:From:To:To:Date:Date:Content-Type:MIME-Version:Message-Id:Reply-To:Cc;
 bh=sDihnr9wPy9i3oazzwGHbCjRXaqhugrQpYLx7o7O9Sc=;
 b=XodiXbfLjHtFEn8nXgF+5ruTxRblK5/pVkpHrTFZpjIWLLd6TAmLmeHA2CeedOQp
 hLH8faBKB5YnphjI+DcyiupttJfSaO3xo42IWkP/7rZVe9svBIPf7XZ4orH3jeDHBhM
 njOxC+YJ/F4bmVGT6pAXbmAgm7Ry9GNFQUqiWea0=
Received: by mx.zohomail.com with SMTPS id 1752257554144758.2452170550929;
 Fri, 11 Jul 2025 11:12:34 -0700 (PDT)
Message-ID: <7299cc15bbb7fc6fb39dce1b035a7d399a136542.camel@collabora.com>
Subject: XDC 2025 - Call for Proposals ends tonight at 23:59 CEST!
From: Mark Filion <mark.filion@collabora.com>
To: dri-devel@lists.freedesktop.org
Date: Fri, 11 Jul 2025 14:12:32 -0400
Content-Type: multipart/alternative; boundary="=-Ki/GadC4Iys4hIA5Inag"
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

--=-Ki/GadC4Iys4hIA5Inag
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello!

The CfP for XDC 2025 ends tonight at=C2=A023:59 CEST! You still have a few
hours left to submit your proposal, don't wait!

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

--=-Ki/GadC4Iys4hIA5Inag
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
oke-width: 0px; text-decoration: none; unicode-bidi: plaintext;">H<span sty=
le=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 52, 54); font-family: &q=
uot;Adwaita Mono&quot;;">ello!</span></div><div style=3D"caret-color: rgb(0=
, 0, 0); color: rgb(0, 0, 0); font-family: &quot;Adwaita Sans&quot;; font-s=
tyle: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; white-sp=
ace: normal; word-spacing: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, =
0.4); -webkit-text-stroke-width: 0px; text-decoration: none; unicode-bidi: =
plaintext;"><br style=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 52, 5=
4); font-family: &quot;Adwaita Mono&quot;;"><span style=3D"caret-color: rgb=
(46, 52, 54); color: rgb(46, 52, 54); font-family: &quot;Adwaita Mono&quot;=
;">The CfP for XDC 2025 ends tonight at&nbsp;</span><span style=3D"caret-co=
lor: rgb(46, 52, 54); color: rgb(46, 52, 54); font-family: &quot;Adwaita Mo=
no&quot;;">23:59 CEST! You still have a few<br>hours left to submit your pr=
oposal, don't wait!</span></div><div style=3D"caret-color: rgb(0, 0, 0); co=
lor: rgb(0, 0, 0); font-family: &quot;Adwaita Sans&quot;; font-style: norma=
l; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; tex=
t-align: start; text-indent: 0px; text-transform: none; white-space: normal=
; word-spacing: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.4); -webk=
it-text-stroke-width: 0px; text-decoration: none; unicode-bidi: plaintext;"=
><br style=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 52, 54); font-fa=
mily: &quot;Adwaita Mono&quot;;"><span style=3D"caret-color: rgb(46, 52, 54=
); color: rgb(46, 52, 54); font-family: &quot;Adwaita Mono&quot;;">&nbsp;&n=
bsp;&nbsp;&nbsp;</span><a href=3D"https://xdc2025.x.org/" title=3D"Click to=
 open https://xdc2025.x.org/" style=3D"color: rgb(46, 52, 54); font-family:=
 &quot;Adwaita Mono&quot;;">https://xdc2025.x.org</a><br style=3D"caret-col=
or: rgb(46, 52, 54); color: rgb(46, 52, 54); font-family: &quot;Adwaita Mon=
o&quot;;"><span style=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 52, 5=
4); font-family: &quot;Adwaita Mono&quot;;">&nbsp;&nbsp;</span><br style=3D=
"caret-color: rgb(46, 52, 54); color: rgb(46, 52, 54); font-family: &quot;A=
dwaita Mono&quot;;"><span style=3D"caret-color: rgb(46, 52, 54); color: rgb=
(46, 52, 54); font-family: &quot;Adwaita Mono&quot;;">As usual, the confere=
nce is free of charge and open to the general</span><br style=3D"caret-colo=
r: rgb(46, 52, 54); color: rgb(46, 52, 54); font-family: &quot;Adwaita Mono=
&quot;;"><span style=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 52, 54=
); font-family: &quot;Adwaita Mono&quot;;">public. If you plan on attending=
, please make sure to register as early</span><br style=3D"caret-color: rgb=
(46, 52, 54); color: rgb(46, 52, 54); font-family: &quot;Adwaita Mono&quot;=
;"><span style=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 52, 54); fon=
t-family: &quot;Adwaita Mono&quot;;">as possible:</span><br style=3D"caret-=
color: rgb(46, 52, 54); color: rgb(46, 52, 54); font-family: &quot;Adwaita =
Mono&quot;;"><br style=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 52, =
54); font-family: &quot;Adwaita Mono&quot;;"><span style=3D"caret-color: rg=
b(46, 52, 54); color: rgb(46, 52, 54); font-family: &quot;Adwaita Mono&quot=
;;">&nbsp;&nbsp;&nbsp;&nbsp;</span><a href=3D"https://indico.freedesktop.or=
g/event/10/registrations/" title=3D"Click to open https://indico.freedeskto=
p.org/event/10/registrations/" style=3D"color: rgb(46, 52, 54); font-family=
: &quot;Adwaita Mono&quot;;">https://indico.freedesktop.org/event/10/regist=
rations/</a><br style=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 52, 5=
4); font-family: &quot;Adwaita Mono&quot;;"><br style=3D"caret-color: rgb(4=
6, 52, 54); color: rgb(46, 52, 54); font-family: &quot;Adwaita Mono&quot;;"=
><span style=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 52, 54); font-=
family: &quot;Adwaita Mono&quot;;">In addition to registration, the CfP is =
now open for talks, demos, and</span><br style=3D"caret-color: rgb(46, 52, =
54); color: rgb(46, 52, 54); font-family: &quot;Adwaita Mono&quot;;"><span =
style=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 52, 54); font-family:=
 &quot;Adwaita Mono&quot;;">workshops at XDC 2025. While any serious propos=
al will be gratefully</span><br style=3D"caret-color: rgb(46, 52, 54); colo=
r: rgb(46, 52, 54); font-family: &quot;Adwaita Mono&quot;;"><span style=3D"=
caret-color: rgb(46, 52, 54); color: rgb(46, 52, 54); font-family: &quot;Ad=
waita Mono&quot;;">considered, topics of interest to X.Org and freedesktop.=
org developers</span><br style=3D"caret-color: rgb(46, 52, 54); color: rgb(=
46, 52, 54); font-family: &quot;Adwaita Mono&quot;;"><span style=3D"caret-c=
olor: rgb(46, 52, 54); color: rgb(46, 52, 54); font-family: &quot;Adwaita M=
ono&quot;;">are encouraged. The program focus is on new development, ongoin=
g</span><br style=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 52, 54); =
font-family: &quot;Adwaita Mono&quot;;"><span style=3D"caret-color: rgb(46,=
 52, 54); color: rgb(46, 52, 54); font-family: &quot;Adwaita Mono&quot;;">c=
hallenges and anything else that will spark discussions among</span><br sty=
le=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 52, 54); font-family: &q=
uot;Adwaita Mono&quot;;"><span style=3D"caret-color: rgb(46, 52, 54); color=
: rgb(46, 52, 54); font-family: &quot;Adwaita Mono&quot;;">attendees in the=
 hallway track.</span><br style=3D"caret-color: rgb(46, 52, 54); color: rgb=
(46, 52, 54); font-family: &quot;Adwaita Mono&quot;;"><br style=3D"caret-co=
lor: rgb(46, 52, 54); color: rgb(46, 52, 54); font-family: &quot;Adwaita Mo=
no&quot;;"><span style=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 52, =
54); font-family: &quot;Adwaita Mono&quot;;">We are open to talks across al=
l layers of the graphics stack, from the</span><br style=3D"caret-color: rg=
b(46, 52, 54); color: rgb(46, 52, 54); font-family: &quot;Adwaita Mono&quot=
;;"><span style=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 52, 54); fo=
nt-family: &quot;Adwaita Mono&quot;;">kernel to desktop environments / grap=
hical applications and about how</span><br style=3D"caret-color: rgb(46, 52=
, 54); color: rgb(46, 52, 54); font-family: &quot;Adwaita Mono&quot;;"><spa=
n style=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 52, 54); font-famil=
y: &quot;Adwaita Mono&quot;;">to make things better for the developers who =
build them. Head to the</span><br style=3D"caret-color: rgb(46, 52, 54); co=
lor: rgb(46, 52, 54); font-family: &quot;Adwaita Mono&quot;;"><span style=
=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 52, 54); font-family: &quo=
t;Adwaita Mono&quot;;">CfP page to learn more:</span><br style=3D"caret-col=
or: rgb(46, 52, 54); color: rgb(46, 52, 54); font-family: &quot;Adwaita Mon=
o&quot;;"><br style=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 52, 54)=
; font-family: &quot;Adwaita Mono&quot;;"><span style=3D"caret-color: rgb(4=
6, 52, 54); color: rgb(46, 52, 54); font-family: &quot;Adwaita Mono&quot;;"=
>&nbsp;&nbsp;&nbsp;&nbsp;</span><a href=3D"https://indico.freedesktop.org/e=
vent/10/abstracts/" title=3D"Click to open https://indico.freedesktop.org/e=
vent/10/abstracts/" style=3D"color: rgb(46, 52, 54); font-family: &quot;Adw=
aita Mono&quot;;">https://indico.freedesktop.org/event/10/abstracts/</a><br=
 style=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 52, 54); font-family=
: &quot;Adwaita Mono&quot;;"><br style=3D"caret-color: rgb(46, 52, 54); col=
or: rgb(46, 52, 54); font-family: &quot;Adwaita Mono&quot;;"><span style=3D=
"caret-color: rgb(46, 52, 54); color: rgb(46, 52, 54); font-family: &quot;A=
dwaita Mono&quot;;">The deadline for submissions Friday, 11 July 2025.</spa=
n><br style=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 52, 54); font-f=
amily: &quot;Adwaita Mono&quot;;"><br style=3D"caret-color: rgb(46, 52, 54)=
; color: rgb(46, 52, 54); font-family: &quot;Adwaita Mono&quot;;"><span sty=
le=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 52, 54); font-family: &q=
uot;Adwaita Mono&quot;;">We are looking forward to seeing you in Vienna! If=
 you have any</span><br style=3D"caret-color: rgb(46, 52, 54); color: rgb(4=
6, 52, 54); font-family: &quot;Adwaita Mono&quot;;"><span style=3D"caret-co=
lor: rgb(46, 52, 54); color: rgb(46, 52, 54); font-family: &quot;Adwaita Mo=
no&quot;;">questions, please email the organizer (hfink at snap.com), addin=
g on</span><br style=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 52, 54=
); font-family: &quot;Adwaita Mono&quot;;"><span style=3D"caret-color: rgb(=
46, 52, 54); color: rgb(46, 52, 54); font-family: &quot;Adwaita Mono&quot;;=
">CC the X.org board (board at foundation.x.org).</span><br style=3D"caret-=
color: rgb(46, 52, 54); color: rgb(46, 52, 54); font-family: &quot;Adwaita =
Mono&quot;;"><br style=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 52, =
54); font-family: &quot;Adwaita Mono&quot;;"><span style=3D"caret-color: rg=
b(46, 52, 54); color: rgb(46, 52, 54); font-family: &quot;Adwaita Mono&quot=
;;">And don't forget, you can follow us on Mastodon for all the latest</spa=
n><br style=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 52, 54); font-f=
amily: &quot;Adwaita Mono&quot;;"><span style=3D"caret-color: rgb(46, 52, 5=
4); color: rgb(46, 52, 54); font-family: &quot;Adwaita Mono&quot;;">updates=
 and to stay connected:</span><br style=3D"caret-color: rgb(46, 52, 54); co=
lor: rgb(46, 52, 54); font-family: &quot;Adwaita Mono&quot;;"><br style=3D"=
caret-color: rgb(46, 52, 54); color: rgb(46, 52, 54); font-family: &quot;Ad=
waita Mono&quot;;"><span style=3D"caret-color: rgb(46, 52, 54); color: rgb(=
46, 52, 54); font-family: &quot;Adwaita Mono&quot;;">&nbsp;&nbsp;&nbsp;&nbs=
p;</span><a href=3D"https://floss.social/@XOrgDevConf" title=3D"Click to op=
en https://floss.social/@XOrgDevConf" style=3D"color: rgb(46, 52, 54); font=
-family: &quot;Adwaita Mono&quot;;">https://floss.social/@XOrgDevConf</a><b=
r style=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 52, 54); font-famil=
y: &quot;Adwaita Mono&quot;;"><br style=3D"caret-color: rgb(46, 52, 54); co=
lor: rgb(46, 52, 54); font-family: &quot;Adwaita Mono&quot;;"><span style=
=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 52, 54); font-family: &quo=
t;Adwaita Mono&quot;;">Best,</span><br style=3D"caret-color: rgb(46, 52, 54=
); color: rgb(46, 52, 54); font-family: &quot;Adwaita Mono&quot;;"><br styl=
e=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 52, 54); font-family: &qu=
ot;Adwaita Mono&quot;;"><span style=3D"caret-color: rgb(46, 52, 54); color:=
 rgb(46, 52, 54); font-family: &quot;Adwaita Mono&quot;;">Mark</span></div>=
<div><span></span></div></body></html>

--=-Ki/GadC4Iys4hIA5Inag--
