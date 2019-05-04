Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3663313708
	for <lists+dri-devel@lfdr.de>; Sat,  4 May 2019 04:33:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0486A8961E;
	Sat,  4 May 2019 02:33:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8373C8961E
 for <dri-devel@lists.freedesktop.org>; Sat,  4 May 2019 02:33:21 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 797727215A; Sat,  4 May 2019 02:33:21 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109524] "Invalid glsl version in shading_language_version()"
 when trying to run directX games using wine
Date: Sat, 04 May 2019 02:33:21 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/DRI/R100
X-Bugzilla-Version: 18.2
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: david@linuxid10t.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-109524-502-TKCnWKPUXe@http.bugs.freedesktop.org/>
In-Reply-To: <bug-109524-502@http.bugs.freedesktop.org/>
References: <bug-109524-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============2093041148=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2093041148==
Content-Type: multipart/alternative; boundary="15569372010.ecCD4.32201"
Content-Transfer-Encoding: 7bit


--15569372010.ecCD4.32201
Date: Sat, 4 May 2019 02:33:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109524

--- Comment #2 from david@linuxid10t.com ---
I have had the same problem in Mesa 19.0.0 with the Nouveau driver.  It see=
ms
that any card without hardware shaders is failing.  This was tested with NV=
05
and NV11.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15569372010.ecCD4.32201
Date: Sat, 4 May 2019 02:33:21 +0000
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
   title=3D"NEW - &quot;Invalid glsl version in shading_language_version()&=
quot; when trying to run directX games using wine"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109524#c2">Commen=
t # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - &quot;Invalid glsl version in shading_language_version()&=
quot; when trying to run directX games using wine"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109524">bug 10952=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
david&#64;linuxid10t.com" title=3D"david&#64;linuxid10t.com">david&#64;linu=
xid10t.com</a>
</span></b>
        <pre>I have had the same problem in Mesa 19.0.0 with the Nouveau dr=
iver.  It seems
that any card without hardware shaders is failing.  This was tested with NV=
05
and NV11.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15569372010.ecCD4.32201--

--===============2093041148==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2093041148==--
