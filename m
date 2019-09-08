Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70EBDACB91
	for <lists+dri-devel@lfdr.de>; Sun,  8 Sep 2019 10:32:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B7B289B66;
	Sun,  8 Sep 2019 08:32:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id A4D0C89B66
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Sep 2019 08:32:16 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 9CAE672168; Sun,  8 Sep 2019 08:32:16 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110630] Random Horizontal green lines after screen resize
Date: Sun, 08 Sep 2019 08:32:16 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: uzix.ls+bugsfreedesktop@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110630-502-ZNnbaPTvYs@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110630-502@http.bugs.freedesktop.org/>
References: <bug-110630-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0383568304=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0383568304==
Content-Type: multipart/alternative; boundary="15679315361.5920AD.3765"
Content-Transfer-Encoding: 7bit


--15679315361.5920AD.3765
Date: Sun, 8 Sep 2019 08:32:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110630

--- Comment #8 from Eugene Uzix <uzix.ls+bugsfreedesktop@gmail.com> ---
Same issue on

Radeon RX 580
Linux 5.2.0-2-amd64 #1 SMP Debian 5.2.9-1 (2019-08-18)
Actual Debian Sid
X.Org X Server 1.20.4, amdgpu 19.0.1
Openbox + compton

Killing compton does not help.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15679315361.5920AD.3765
Date: Sun, 8 Sep 2019 08:32:16 +0000
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
   title=3D"NEW - Random Horizontal green lines after screen resize"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110630#c8">Commen=
t # 8</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Random Horizontal green lines after screen resize"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110630">bug 11063=
0</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
uzix.ls+bugsfreedesktop&#64;gmail.com" title=3D"Eugene Uzix &lt;uzix.ls+bug=
sfreedesktop&#64;gmail.com&gt;"> <span class=3D"fn">Eugene Uzix</span></a>
</span></b>
        <pre>Same issue on

Radeon RX 580
Linux 5.2.0-2-amd64 #1 SMP Debian 5.2.9-1 (2019-08-18)
Actual Debian Sid
X.Org X Server 1.20.4, amdgpu 19.0.1
Openbox + compton

Killing compton does not help.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15679315361.5920AD.3765--

--===============0383568304==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0383568304==--
