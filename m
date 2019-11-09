Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD76F5E95
	for <lists+dri-devel@lfdr.de>; Sat,  9 Nov 2019 12:07:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 218066E115;
	Sat,  9 Nov 2019 11:07:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 07F616E115
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Nov 2019 11:07:38 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id F39BC720E2; Sat,  9 Nov 2019 11:07:37 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: =?UTF-8?B?W0J1ZyAxMTExMjRdIFtkcm06YW1kZ3B1X2RtX2F0b21pY19jb21taXRfdGFp?=
 =?UTF-8?B?bCBbYW1kZ3B1XV0gKkVSUk9SKiBXYWl0aW5nIGZvciBmZW5jZXMgdGltZWQg?=
 =?UTF-8?B?b3V0IG9yIGludGVycnVwdGVkISBoYXBwZW5zIGV2ZXJ5IHRpbWUgd2hlbiBh?=
 =?UTF-8?B?INGBdXRzY2VuZSBzaG93ZWQgaW4gTWF4IFBheW5lIDM=?=
Date: Sat, 09 Nov 2019 11:07:38 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: harald.linden@thelow.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111124-502-cOccuzlmpP@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111124-502@http.bugs.freedesktop.org/>
References: <bug-111124-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1699087187=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1699087187==
Content-Type: multipart/alternative; boundary="15732976570.E2b57A07.29142"
Content-Transfer-Encoding: 7bit


--15732976570.E2b57A07.29142
Date: Sat, 9 Nov 2019 11:07:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111124

--- Comment #10 from Harald Linden <harald.linden@thelow.net> ---
I can report the same problem running Kerbal Space Program (ksp) 1.4.5.
Occasionally, during EVAs on planetary surfaces, the games freezes for ten
seconds and the error message above shows up in the kernel log.

Distro: Debian GNU/Linux bullseye/sid
Kernel: 5.3.0-1-amd64 #1 SMP Debian 5.3.7-1 (2019-10-19) x86_64
Mesa: Mesa 19.2.3
libdrm: 2.4.99-1
llvm: 8.0.1-3+b1
GPU: "AMD Radeon (TM) RX 480 Graphics" (ChipID =3D 0x67df)

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15732976570.E2b57A07.29142
Date: Sat, 9 Nov 2019 11:07:37 +0000
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
   title=3D"NEW - [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiti=
ng for fences timed out or interrupted! happens every time when a =D1=81uts=
cene showed in Max Payne 3"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111124#c10">Comme=
nt # 10</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiti=
ng for fences timed out or interrupted! happens every time when a =D1=81uts=
cene showed in Max Payne 3"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111124">bug 11112=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
harald.linden&#64;thelow.net" title=3D"Harald Linden &lt;harald.linden&#64;=
thelow.net&gt;"> <span class=3D"fn">Harald Linden</span></a>
</span></b>
        <pre>I can report the same problem running Kerbal Space Program (ks=
p) 1.4.5.
Occasionally, during EVAs on planetary surfaces, the games freezes for ten
seconds and the error message above shows up in the kernel log.

Distro: Debian GNU/Linux bullseye/sid
Kernel: 5.3.0-1-amd64 #1 SMP Debian 5.3.7-1 (2019-10-19) x86_64
Mesa: Mesa 19.2.3
libdrm: 2.4.99-1
llvm: 8.0.1-3+b1
GPU: &quot;AMD Radeon (TM) RX 480 Graphics&quot; (ChipID =3D 0x67df)</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15732976570.E2b57A07.29142--

--===============1699087187==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1699087187==--
