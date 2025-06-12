Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0F1AD735A
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 16:15:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7CA210E88B;
	Thu, 12 Jun 2025 14:15:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=mark.filion@collabora.com header.b="IT+ZWtBu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o16.zoho.com (sender4-op-o16.zoho.com
 [136.143.188.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 407D310E88C
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 14:15:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1749737708; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=G/dB4dXwPPCBqYb0wmHeZfTin5ZeMTDBQNZX/WiTD7AZng56y33ksRATw7Y/jKYpg68SNgl9WguhE8Tor4xTHh89HEY72CCuaxmHhIiA/L+/dSGdBpSWnMYAntFTiotD+BNX6BpC73yOHznC+yjLIZqwWUC265JZJK0wQv8H8QI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1749737708;
 h=Content-Type:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc;
 bh=DeWS5n17/dwh/9Ajn7VZyiHo5ZUrip3XVfGbaNN+4LM=; 
 b=GbfzV8pj6D3N/F5Kj6jr0e9t1GaVAtLjcnFUf0Xrwo/DFwIsaWcBAfRhVvztUTPG1bIRdvZJM6UPXAEJzCK9TF2qq4CD/PVzUa9+MQDrNsvWGqSDPbgkMQtLICAZKIJPCiUo2Xp/iWD2P4w3uqYewLHeH3OTKhQEdZHcJF8+hp0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=mark.filion@collabora.com;
 dmarc=pass header.from=<mark.filion@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1749737708; 
 s=zohomail; d=collabora.com; i=mark.filion@collabora.com;
 h=Message-ID:Subject:Subject:From:From:To:To:Date:Date:Content-Type:MIME-Version:Message-Id:Reply-To:Cc;
 bh=DeWS5n17/dwh/9Ajn7VZyiHo5ZUrip3XVfGbaNN+4LM=;
 b=IT+ZWtBu27erhxXUxgcs63KSvhmcgoJt1eG4Yva8p+8fju8BlCePe9w8iBYF5tUI
 LSt/Q+3/rOhBhTJeklHB7EvzDuhLyiA1xou3Nl1HpqGBosaBiSm3p8ciqB1U3gIpTty
 os+2O/F24FJd3yrF/kIoZOJsGj5SWJsuWaIWrR0U=
Received: by mx.zohomail.com with SMTPS id 1749737707568641.3809559593625;
 Thu, 12 Jun 2025 07:15:07 -0700 (PDT)
Message-ID: <f292547fbcbb0daca3f77f8db1b95cc7bca0719a.camel@collabora.com>
Subject: Reminder: Registration & Call for Proposals open for XDC 2025
From: Mark Filion <mark.filion@collabora.com>
To: dri-devel@lists.freedesktop.org
Date: Thu, 12 Jun 2025 10:15:06 -0400
Content-Type: multipart/alternative; boundary="=-4dRrWAqSQnwk+rkeXzaw"
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

--=-4dRrWAqSQnwk+rkeXzaw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello!

Registration & Call for Proposals are open for XDC 2025, which will
take place at the=C2=A0 TU Wien Kuppelsaal in Vienna, Austria on 29
September to 1 October.

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

--=-4dRrWAqSQnwk+rkeXzaw
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
</style></head><body><div><div><span style=3D"caret-color: rgb(46, 52, 54);=
 color: rgb(46, 52, 54); font-family: &quot;Adwaita Mono&quot;;">Hello!</sp=
an><br style=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 52, 54); font-=
family: &quot;Adwaita Mono&quot;;"><br style=3D"caret-color: rgb(46, 52, 54=
); color: rgb(46, 52, 54); font-family: &quot;Adwaita Mono&quot;;"><span st=
yle=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 52, 54); font-family: &=
quot;Adwaita Mono&quot;;">Registration &amp; Call for Proposals are open fo=
r XDC 2025, which will</span><br style=3D"caret-color: rgb(46, 52, 54); col=
or: rgb(46, 52, 54); font-family: &quot;Adwaita Mono&quot;;"><span style=3D=
"caret-color: rgb(46, 52, 54); color: rgb(46, 52, 54); font-family: &quot;A=
dwaita Mono&quot;;">take place at the&nbsp; TU Wien Kuppelsaal in Vienna, A=
ustria on 29</span><br style=3D"caret-color: rgb(46, 52, 54); color: rgb(46=
, 52, 54); font-family: &quot;Adwaita Mono&quot;;"><span style=3D"caret-col=
or: rgb(46, 52, 54); color: rgb(46, 52, 54); font-family: &quot;Adwaita Mon=
o&quot;;">September to 1 October.</span><br style=3D"caret-color: rgb(46, 5=
2, 54); color: rgb(46, 52, 54); font-family: &quot;Adwaita Mono&quot;;"><br=
 style=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 52, 54); font-family=
: &quot;Adwaita Mono&quot;;"><span style=3D"caret-color: rgb(46, 52, 54); c=
olor: rgb(46, 52, 54); font-family: &quot;Adwaita Mono&quot;;">&nbsp;&nbsp;=
&nbsp;&nbsp;</span><a href=3D"https://xdc2025.x.org/" title=3D"Click to ope=
n https://xdc2025.x.org/" style=3D"font-family: &quot;Adwaita Mono&quot;;">=
https://xdc2025.x.org</a><br style=3D"caret-color: rgb(46, 52, 54); color: =
rgb(46, 52, 54); font-family: &quot;Adwaita Mono&quot;;"><span style=3D"car=
et-color: rgb(46, 52, 54); color: rgb(46, 52, 54); font-family: &quot;Adwai=
ta Mono&quot;;">&nbsp;&nbsp;</span><br style=3D"caret-color: rgb(46, 52, 54=
); color: rgb(46, 52, 54); font-family: &quot;Adwaita Mono&quot;;"><span st=
yle=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 52, 54); font-family: &=
quot;Adwaita Mono&quot;;">As usual, the conference is free of charge and op=
en to the general</span><br style=3D"caret-color: rgb(46, 52, 54); color: r=
gb(46, 52, 54); font-family: &quot;Adwaita Mono&quot;;"><span style=3D"care=
t-color: rgb(46, 52, 54); color: rgb(46, 52, 54); font-family: &quot;Adwait=
a Mono&quot;;">public. If you plan on attending, please make sure to regist=
er as early</span><br style=3D"caret-color: rgb(46, 52, 54); color: rgb(46,=
 52, 54); font-family: &quot;Adwaita Mono&quot;;"><span style=3D"caret-colo=
r: rgb(46, 52, 54); color: rgb(46, 52, 54); font-family: &quot;Adwaita Mono=
&quot;;">as possible:</span><br style=3D"caret-color: rgb(46, 52, 54); colo=
r: rgb(46, 52, 54); font-family: &quot;Adwaita Mono&quot;;"><br style=3D"ca=
ret-color: rgb(46, 52, 54); color: rgb(46, 52, 54); font-family: &quot;Adwa=
ita Mono&quot;;"><span style=3D"caret-color: rgb(46, 52, 54); color: rgb(46=
, 52, 54); font-family: &quot;Adwaita Mono&quot;;">&nbsp;&nbsp;&nbsp;&nbsp;=
</span><a href=3D"https://indico.freedesktop.org/event/10/registrations/" t=
itle=3D"Click to open https://indico.freedesktop.org/event/10/registrations=
/" style=3D"font-family: &quot;Adwaita Mono&quot;;">https://indico.freedesk=
top.org/event/10/registrations/</a><br style=3D"caret-color: rgb(46, 52, 54=
); color: rgb(46, 52, 54); font-family: &quot;Adwaita Mono&quot;;"><br styl=
e=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 52, 54); font-family: &qu=
ot;Adwaita Mono&quot;;"><span style=3D"caret-color: rgb(46, 52, 54); color:=
 rgb(46, 52, 54); font-family: &quot;Adwaita Mono&quot;;">In addition to re=
gistration, the CfP is now open for talks, demos, and</span><br style=3D"ca=
ret-color: rgb(46, 52, 54); color: rgb(46, 52, 54); font-family: &quot;Adwa=
ita Mono&quot;;"><span style=3D"caret-color: rgb(46, 52, 54); color: rgb(46=
, 52, 54); font-family: &quot;Adwaita Mono&quot;;">workshops at XDC 2025. W=
hile any serious proposal will be gratefully</span><br style=3D"caret-color=
: rgb(46, 52, 54); color: rgb(46, 52, 54); font-family: &quot;Adwaita Mono&=
quot;;"><span style=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 52, 54)=
; font-family: &quot;Adwaita Mono&quot;;">considered, topics of interest to=
 X.Org and freedesktop.org developers</span><br style=3D"caret-color: rgb(4=
6, 52, 54); color: rgb(46, 52, 54); font-family: &quot;Adwaita Mono&quot;;"=
><span style=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 52, 54); font-=
family: &quot;Adwaita Mono&quot;;">are encouraged. The program focus is on =
new development, ongoing</span><br style=3D"caret-color: rgb(46, 52, 54); c=
olor: rgb(46, 52, 54); font-family: &quot;Adwaita Mono&quot;;"><span style=
=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 52, 54); font-family: &quo=
t;Adwaita Mono&quot;;">challenges and anything else that will spark discuss=
ions among</span><br style=3D"caret-color: rgb(46, 52, 54); color: rgb(46, =
52, 54); font-family: &quot;Adwaita Mono&quot;;"><span style=3D"caret-color=
: rgb(46, 52, 54); color: rgb(46, 52, 54); font-family: &quot;Adwaita Mono&=
quot;;">attendees in the hallway track.</span><br style=3D"caret-color: rgb=
(46, 52, 54); color: rgb(46, 52, 54); font-family: &quot;Adwaita Mono&quot;=
;"><br style=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 52, 54); font-=
family: &quot;Adwaita Mono&quot;;"><span style=3D"caret-color: rgb(46, 52, =
54); color: rgb(46, 52, 54); font-family: &quot;Adwaita Mono&quot;;">We are=
 open to talks across all layers of the graphics stack, from the</span><br =
style=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 52, 54); font-family:=
 &quot;Adwaita Mono&quot;;"><span style=3D"caret-color: rgb(46, 52, 54); co=
lor: rgb(46, 52, 54); font-family: &quot;Adwaita Mono&quot;;">kernel to des=
ktop environments / graphical applications and about how</span><br style=3D=
"caret-color: rgb(46, 52, 54); color: rgb(46, 52, 54); font-family: &quot;A=
dwaita Mono&quot;;"><span style=3D"caret-color: rgb(46, 52, 54); color: rgb=
(46, 52, 54); font-family: &quot;Adwaita Mono&quot;;">to make things better=
 for the developers who build them. Head to the</span><br style=3D"caret-co=
lor: rgb(46, 52, 54); color: rgb(46, 52, 54); font-family: &quot;Adwaita Mo=
no&quot;;"><span style=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 52, =
54); font-family: &quot;Adwaita Mono&quot;;">CfP page to learn more:</span>=
<br style=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 52, 54); font-fam=
ily: &quot;Adwaita Mono&quot;;"><br style=3D"caret-color: rgb(46, 52, 54); =
color: rgb(46, 52, 54); font-family: &quot;Adwaita Mono&quot;;"><span style=
=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 52, 54); font-family: &quo=
t;Adwaita Mono&quot;;">&nbsp;&nbsp;&nbsp;&nbsp;</span><a href=3D"https://in=
dico.freedesktop.org/event/10/abstracts/" title=3D"Click to open https://in=
dico.freedesktop.org/event/10/abstracts/" style=3D"font-family: &quot;Adwai=
ta Mono&quot;;">https://indico.freedesktop.org/event/10/abstracts/</a><br s=
tyle=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 52, 54); font-family: =
&quot;Adwaita Mono&quot;;"><br style=3D"caret-color: rgb(46, 52, 54); color=
: rgb(46, 52, 54); font-family: &quot;Adwaita Mono&quot;;"><span style=3D"c=
aret-color: rgb(46, 52, 54); color: rgb(46, 52, 54); font-family: &quot;Adw=
aita Mono&quot;;">The deadline for submissions Friday, 11 July 2025.</span>=
<br style=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 52, 54); font-fam=
ily: &quot;Adwaita Mono&quot;;"><br style=3D"caret-color: rgb(46, 52, 54); =
color: rgb(46, 52, 54); font-family: &quot;Adwaita Mono&quot;;"><span style=
=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 52, 54); font-family: &quo=
t;Adwaita Mono&quot;;">We are looking forward to seeing you in Vienna! If y=
ou have any</span><br style=3D"caret-color: rgb(46, 52, 54); color: rgb(46,=
 52, 54); font-family: &quot;Adwaita Mono&quot;;"><span style=3D"caret-colo=
r: rgb(46, 52, 54); color: rgb(46, 52, 54); font-family: &quot;Adwaita Mono=
&quot;;">questions, please email the organizer (hfink at snap.com), adding =
on</span><br style=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 52, 54);=
 font-family: &quot;Adwaita Mono&quot;;"><span style=3D"caret-color: rgb(46=
, 52, 54); color: rgb(46, 52, 54); font-family: &quot;Adwaita Mono&quot;;">=
CC the X.org board (board at foundation.x.org).</span><br style=3D"caret-co=
lor: rgb(46, 52, 54); color: rgb(46, 52, 54); font-family: &quot;Adwaita Mo=
no&quot;;"><br style=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 52, 54=
); font-family: &quot;Adwaita Mono&quot;;"><span style=3D"caret-color: rgb(=
46, 52, 54); color: rgb(46, 52, 54); font-family: &quot;Adwaita Mono&quot;;=
">And don't forget, you can follow us on Mastodon for all the latest</span>=
<br style=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 52, 54); font-fam=
ily: &quot;Adwaita Mono&quot;;"><span style=3D"caret-color: rgb(46, 52, 54)=
; color: rgb(46, 52, 54); font-family: &quot;Adwaita Mono&quot;;">updates a=
nd to stay connected:</span><br style=3D"caret-color: rgb(46, 52, 54); colo=
r: rgb(46, 52, 54); font-family: &quot;Adwaita Mono&quot;;"><br style=3D"ca=
ret-color: rgb(46, 52, 54); color: rgb(46, 52, 54); font-family: &quot;Adwa=
ita Mono&quot;;"><span style=3D"caret-color: rgb(46, 52, 54); color: rgb(46=
, 52, 54); font-family: &quot;Adwaita Mono&quot;;">&nbsp;&nbsp;&nbsp;&nbsp;=
</span><a href=3D"https://floss.social/@XOrgDevConf" title=3D"Click to open=
 https://floss.social/@XOrgDevConf" style=3D"font-family: &quot;Adwaita Mon=
o&quot;;">https://floss.social/@XOrgDevConf</a><br style=3D"caret-color: rg=
b(46, 52, 54); color: rgb(46, 52, 54); font-family: &quot;Adwaita Mono&quot=
;;"><br style=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 52, 54); font=
-family: &quot;Adwaita Mono&quot;;"><span style=3D"caret-color: rgb(46, 52,=
 54); color: rgb(46, 52, 54); font-family: &quot;Adwaita Mono&quot;;">Best,=
</span><br style=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 52, 54); f=
ont-family: &quot;Adwaita Mono&quot;;"><br style=3D"caret-color: rgb(46, 52=
, 54); color: rgb(46, 52, 54); font-family: &quot;Adwaita Mono&quot;;"><spa=
n style=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 52, 54); font-famil=
y: &quot;Adwaita Mono&quot;;">Mark</span></div></div><div><span></span></di=
v></body></html>

--=-4dRrWAqSQnwk+rkeXzaw--
