Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C43BFAB1CC
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2019 06:50:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C425289E8C;
	Fri,  6 Sep 2019 04:50:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 196A789F2D
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2019 04:50:04 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 1644B72161; Fri,  6 Sep 2019 04:50:04 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 105718] amdgpu reported fan speed looks too high (dual fan
 Sapphire Pulse Vega 56)
Date: Fri, 06 Sep 2019 04:50:04 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: shtetldik@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-105718-502-jgsq5LaRaZ@http.bugs.freedesktop.org/>
In-Reply-To: <bug-105718-502@http.bugs.freedesktop.org/>
References: <bug-105718-502@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Content-Type: multipart/mixed; boundary="===============2011327853=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2011327853==
Content-Type: multipart/alternative; boundary="15677454040.eB37.16807"
Content-Transfer-Encoding: 7bit


--15677454040.eB37.16807
Date: Fri, 6 Sep 2019 04:50:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D105718

--- Comment #5 from Shmerl <shtetldik@gmail.com> ---
Actually, I've noticed another similar issue. I just got Sapphire Pulse RX =
5700
XT. It's also dual fan.

According to this:
https://www.gamersnexus.net/hwreviews/3498-sapphire-rx-5700-xt-pulse-review

The top level of fan rotation (at high load and more performance BIOS setti=
ng)
is around 1570 rpm. While sensors report that max is 3200 rpm for me!

And something like 50% load (of the fan) is shown as around 1600 RPM!

So I'd say something is definitely off. It's almost like values from both f=
ans
are added up, instead of showing actual one.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15677454040.eB37.16807
Date: Fri, 6 Sep 2019 04:50:04 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - amdgpu reported fan speed looks too high (dual fan Sapphi=
re Pulse Vega 56)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105718#c5">Commen=
t # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - amdgpu reported fan speed looks too high (dual fan Sapphi=
re Pulse Vega 56)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105718">bug 10571=
8</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
shtetldik&#64;gmail.com" title=3D"Shmerl &lt;shtetldik&#64;gmail.com&gt;"> =
<span class=3D"fn">Shmerl</span></a>
</span></b>
        <pre>Actually, I've noticed another similar issue. I just got Sapph=
ire Pulse RX 5700
XT. It's also dual fan.

According to this:
<a href=3D"https://www.gamersnexus.net/hwreviews/3498-sapphire-rx-5700-xt-p=
ulse-review">https://www.gamersnexus.net/hwreviews/3498-sapphire-rx-5700-xt=
-pulse-review</a>

The top level of fan rotation (at high load and more performance BIOS setti=
ng)
is around 1570 rpm. While sensors report that max is 3200 rpm for me!

And something like 50% load (of the fan) is shown as around 1600 RPM!

So I'd say something is definitely off. It's almost like values from both f=
ans
are added up, instead of showing actual one.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15677454040.eB37.16807--

--===============2011327853==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2011327853==--
