Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B38799EF
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2019 22:28:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A0F66E243;
	Mon, 29 Jul 2019 20:28:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 138A66E243
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2019 20:28:41 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 0FB1372167; Mon, 29 Jul 2019 20:28:41 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110956] List of 19.20-812932 release mistakes
Date: Mon, 29 Jul 2019 20:28:41 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu-pro
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: Jeremy.Newton@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110956-502-R15x8t7hQB@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110956-502@http.bugs.freedesktop.org/>
References: <bug-110956-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1906351538=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1906351538==
Content-Type: multipart/alternative; boundary="15644321210.e7e8ab.10371"
Content-Transfer-Encoding: 7bit


--15644321210.e7e8ab.10371
Date: Mon, 29 Jul 2019 20:28:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110956

--- Comment #8 from Jeremy Newton <Jeremy.Newton@amd.com> ---
A few notes:
- Installing on 32bit is unsupported, but you could in theory still do it a=
s I
don't thing we block this. This configuration is not advised.
- I am looking into a better way of providing source packages for open
components. I might just make a PPA but design is pending.
- We do not support --no-dkms with --pro, granted this should be documented=
 but
is likely not.
- PX should be marked as deprecated in the installer, this is likely not yet
documented correctly.
- I'm aware of the mesa dri post install script issues. I pushed some fixes,
but I'm not sure which build it landed in.

Will try to address the individual bugs if I haven't done so already.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15644321210.e7e8ab.10371
Date: Mon, 29 Jul 2019 20:28:41 +0000
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
   title=3D"NEW - List of 19.20-812932 release mistakes"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110956#c8">Commen=
t # 8</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - List of 19.20-812932 release mistakes"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110956">bug 11095=
6</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
Jeremy.Newton&#64;amd.com" title=3D"Jeremy Newton &lt;Jeremy.Newton&#64;amd=
.com&gt;"> <span class=3D"fn">Jeremy Newton</span></a>
</span></b>
        <pre>A few notes:
- Installing on 32bit is unsupported, but you could in theory still do it a=
s I
don't thing we block this. This configuration is not advised.
- I am looking into a better way of providing source packages for open
components. I might just make a PPA but design is pending.
- We do not support --no-dkms with --pro, granted this should be documented=
 but
is likely not.
- PX should be marked as deprecated in the installer, this is likely not yet
documented correctly.
- I'm aware of the mesa dri post install script issues. I pushed some fixes,
but I'm not sure which build it landed in.

Will try to address the individual bugs if I haven't done so already.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15644321210.e7e8ab.10371--

--===============1906351538==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1906351538==--
