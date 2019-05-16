Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F4920C78
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2019 18:06:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C71C289781;
	Thu, 16 May 2019 16:06:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8AEE989781
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2019 16:06:10 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 82CFE72167; Thu, 16 May 2019 16:06:10 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110659] pageflipping seems to cause jittering on mouse input
 when running Hitman 2 in Wine/DXVK with amdgpu.dc=1
Date: Thu, 16 May 2019 16:06:10 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: tempel.julian@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110659-502-APxKWEYBvv@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110659-502@http.bugs.freedesktop.org/>
References: <bug-110659-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1063115301=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1063115301==
Content-Type: multipart/alternative; boundary="15580227702.87C1.1225"
Content-Transfer-Encoding: 7bit


--15580227702.87C1.1225
Date: Thu, 16 May 2019 16:06:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110659

--- Comment #5 from tempel.julian@gmail.com ---
Yes, it also happens with Linux 5.1.

It btw. runs fine on xwayland inside a Plasma Wayland session.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15580227702.87C1.1225
Date: Thu, 16 May 2019 16:06:10 +0000
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
   title=3D"NEW - pageflipping seems to cause jittering on mouse input when=
 running Hitman 2 in Wine/DXVK with amdgpu.dc=3D1"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110659#c5">Commen=
t # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - pageflipping seems to cause jittering on mouse input when=
 running Hitman 2 in Wine/DXVK with amdgpu.dc=3D1"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110659">bug 11065=
9</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
tempel.julian&#64;gmail.com" title=3D"tempel.julian&#64;gmail.com">tempel.j=
ulian&#64;gmail.com</a>
</span></b>
        <pre>Yes, it also happens with Linux 5.1.

It btw. runs fine on xwayland inside a Plasma Wayland session.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15580227702.87C1.1225--

--===============1063115301==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1063115301==--
