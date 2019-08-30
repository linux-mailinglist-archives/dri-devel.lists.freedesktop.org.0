Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E03A395C
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2019 16:37:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC1906E0FF;
	Fri, 30 Aug 2019 14:37:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5C63F6E0FF
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2019 14:37:55 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 4EBB372161; Fri, 30 Aug 2019 14:37:55 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110979] [amd tahiti xt][amdgpu] ERROR: "dm_ip_block"
 [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!, without DC enabled
Date: Fri, 30 Aug 2019 14:37:55 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: petrcvekcz@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110979-502-xTbzrIK1oc@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110979-502@http.bugs.freedesktop.org/>
References: <bug-110979-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0600820814=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0600820814==
Content-Type: multipart/alternative; boundary="15671758750.9ac6D.16627"
Content-Transfer-Encoding: 7bit


--15671758750.9ac6D.16627
Date: Fri, 30 Aug 2019 14:37:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110979

--- Comment #2 from Petr Cvek <petrcvekcz@gmail.com> ---
The patch above should fix it, tested the compilation for MIPS + Polaris 11.
The actual functionality was not tested (yet).

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15671758750.9ac6D.16627
Date: Fri, 30 Aug 2019 14:37:55 +0000
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
   title=3D"NEW - [amd tahiti xt][amdgpu] ERROR: &quot;dm_ip_block&quot; [d=
rivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!, without DC enabled"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110979#c2">Commen=
t # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [amd tahiti xt][amdgpu] ERROR: &quot;dm_ip_block&quot; [d=
rivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!, without DC enabled"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110979">bug 11097=
9</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
petrcvekcz&#64;gmail.com" title=3D"Petr Cvek &lt;petrcvekcz&#64;gmail.com&g=
t;"> <span class=3D"fn">Petr Cvek</span></a>
</span></b>
        <pre>The patch above should fix it, tested the compilation for MIPS=
 + Polaris 11.
The actual functionality was not tested (yet).</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15671758750.9ac6D.16627--

--===============0600820814==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0600820814==--
