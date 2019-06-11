Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5CBA3C9EC
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 13:23:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF82C890F2;
	Tue, 11 Jun 2019 11:23:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5685F8918A
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 11:23:55 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 5283F72167; Tue, 11 Jun 2019 11:23:55 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110781] Radeon: heavy r300 performance drop regression between
 11.x and 19.x
Date: Tue, 11 Jun 2019 11:23:55 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/r300
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: rsalvaterra@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110781-502-T1nVJZBMew@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110781-502@http.bugs.freedesktop.org/>
References: <bug-110781-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1558543636=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1558543636==
Content-Type: multipart/alternative; boundary="15602522353.033fE.16314"
Content-Transfer-Encoding: 7bit


--15602522353.033fE.16314
Date: Tue, 11 Jun 2019 11:23:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110781

--- Comment #63 from Rui Salvaterra <rsalvaterra@gmail.com> ---
(In reply to Richard Thier from comment #62)
> Added a blog post about the whole issue and its solving process here:
>=20
> http://ballmerpeak.web.elte.hu/devblog/debugging-mesa-and-the-linux-3d-
> graphics-stack.html
>=20
> I have linked to this bug report and every other place and people where
> communications were done for solving this slowdown issue.
>=20
> I just wanted to put things together as it might be valuable for others
> wanting to do similar things - I was and still is a rookie for these thin=
gs
> after all.

Nice article! I'll read it thoroughly when I get home, probably while also
testing your v3 and trying to squeeze some performance numbers out of my pa=
tch.
;)

Cheers!

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15602522353.033fE.16314
Date: Tue, 11 Jun 2019 11:23:55 +0000
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
   title=3D"NEW - Radeon: heavy r300 performance drop regression between 11=
.x and 19.x"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110781#c63">Comme=
nt # 63</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Radeon: heavy r300 performance drop regression between 11=
.x and 19.x"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110781">bug 11078=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
rsalvaterra&#64;gmail.com" title=3D"Rui Salvaterra &lt;rsalvaterra&#64;gmai=
l.com&gt;"> <span class=3D"fn">Rui Salvaterra</span></a>
</span></b>
        <pre>(In reply to Richard Thier from <a href=3D"show_bug.cgi?id=3D1=
10781#c62">comment #62</a>)
<span class=3D"quote">&gt; Added a blog post about the whole issue and its =
solving process here:
&gt;=20
&gt; <a href=3D"http://ballmerpeak.web.elte.hu/devblog/debugging-mesa-and-t=
he-linux-3d">http://ballmerpeak.web.elte.hu/devblog/debugging-mesa-and-the-=
linux-3d</a>-
&gt; graphics-stack.html
&gt;=20
&gt; I have linked to this bug report and every other place and people where
&gt; communications were done for solving this slowdown issue.
&gt;=20
&gt; I just wanted to put things together as it might be valuable for others
&gt; wanting to do similar things - I was and still is a rookie for these t=
hings
&gt; after all.</span >

Nice article! I'll read it thoroughly when I get home, probably while also
testing your v3 and trying to squeeze some performance numbers out of my pa=
tch.
;)

Cheers!</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15602522353.033fE.16314--

--===============1558543636==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1558543636==--
