Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D69A2B36
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2019 01:57:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A31D6E229;
	Thu, 29 Aug 2019 23:57:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id BD2156E229
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2019 23:57:00 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id B6C4F721AA; Thu, 29 Aug 2019 23:57:00 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111241] Shadertoy shader causing hang
Date: Thu, 29 Aug 2019 23:57:01 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: 19.1
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: Dieter@nuetzel-hh.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111241-502-OKxJfQDf0m@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111241-502@http.bugs.freedesktop.org/>
References: <bug-111241-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0605979886=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0605979886==
Content-Type: multipart/alternative; boundary="15671230201.3fE0c5Cb6.30921"
Content-Transfer-Encoding: 7bit


--15671230201.3fE0c5Cb6.30921
Date: Thu, 29 Aug 2019 23:57:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111241

--- Comment #7 from Dieter N=C3=BCtzel <Dieter@nuetzel-hh.de> ---
Works for me with commit #

glsl: replace 'x + (-x)' with constant 0
https://cgit.freedesktop.org/mesa/mesa/commit/?id=3D47cc660d9c19572e5ef2dce=
7c8ae1766a2ac9885

Thanks Pierre-Eric!

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15671230201.3fE0c5Cb6.30921
Date: Thu, 29 Aug 2019 23:57:00 +0000
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
   title=3D"NEW - Shadertoy shader causing hang"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111241#c7">Commen=
t # 7</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Shadertoy shader causing hang"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111241">bug 11124=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
Dieter&#64;nuetzel-hh.de" title=3D"Dieter N=C3=BCtzel &lt;Dieter&#64;nuetze=
l-hh.de&gt;"> <span class=3D"fn">Dieter N=C3=BCtzel</span></a>
</span></b>
        <pre>Works for me with commit #

glsl: replace 'x + (-x)' with constant 0
<a href=3D"https://cgit.freedesktop.org/mesa/mesa/commit/?id=3D47cc660d9c19=
572e5ef2dce7c8ae1766a2ac9885">https://cgit.freedesktop.org/mesa/mesa/commit=
/?id=3D47cc660d9c19572e5ef2dce7c8ae1766a2ac9885</a>

Thanks Pierre-Eric!</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15671230201.3fE0c5Cb6.30921--

--===============0605979886==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0605979886==--
