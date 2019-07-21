Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B4E6F141
	for <lists+dri-devel@lfdr.de>; Sun, 21 Jul 2019 04:29:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A540B89AC3;
	Sun, 21 Jul 2019 02:29:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id C1BBE898F5
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Jul 2019 02:29:03 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id B422B72167; Sun, 21 Jul 2019 02:29:03 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111123] Display issues AMD RAVEN Ryzen 5 3400G APU
Date: Sun, 21 Jul 2019 02:29:04 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: briancschott@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111123-502-zgif7ogNHN@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111123-502@http.bugs.freedesktop.org/>
References: <bug-111123-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1053407652=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1053407652==
Content-Type: multipart/alternative; boundary="15636761430.f05Cf76af.15717"
Content-Transfer-Encoding: 7bit


--15636761430.f05Cf76af.15717
Date: Sun, 21 Jul 2019 02:29:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111123

--- Comment #3 from Brian Schott <briancschott@gmail.com> ---
I have this problem as well with my 3400G. It's very similar to the problem
that my 2700u laptop has with 5.2:
https://bugs.freedesktop.org/show_bug.cgi?id=3D111122

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15636761430.f05Cf76af.15717
Date: Sun, 21 Jul 2019 02:29:03 +0000
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
   title=3D"NEW - Display issues AMD RAVEN Ryzen 5 3400G APU"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111123#c3">Commen=
t # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Display issues AMD RAVEN Ryzen 5 3400G APU"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111123">bug 11112=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
briancschott&#64;gmail.com" title=3D"Brian Schott &lt;briancschott&#64;gmai=
l.com&gt;"> <span class=3D"fn">Brian Schott</span></a>
</span></b>
        <pre>I have this problem as well with my 3400G. It's very similar t=
o the problem
that my 2700u laptop has with 5.2:
<a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - 2500U: Graphics corruption on kernel 5.2"
   href=3D"show_bug.cgi?id=3D111122">https://bugs.freedesktop.org/show_bug.=
cgi?id=3D111122</a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15636761430.f05Cf76af.15717--

--===============1053407652==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1053407652==--
