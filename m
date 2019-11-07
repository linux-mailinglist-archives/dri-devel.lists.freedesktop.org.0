Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A80F26D2
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 06:20:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED71F6EE88;
	Thu,  7 Nov 2019 05:20:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id C6C7C6EE90
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 05:20:29 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id C3D65720E2; Thu,  7 Nov 2019 05:20:29 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111481] AMD Navi GPU frequent freezes on both Manjaro/Ubuntu
 with kernel 5.3 and mesa 19.2 -git/llvm9
Date: Thu, 07 Nov 2019 05:20:29 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: shtetldik@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: highest
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111481-502-r3tIbXqWuQ@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111481-502@http.bugs.freedesktop.org/>
References: <bug-111481-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1905847623=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1905847623==
Content-Type: multipart/alternative; boundary="157310402912.7acD.17356"
Content-Transfer-Encoding: 7bit


--157310402912.7acD.17356
Date: Thu, 7 Nov 2019 05:20:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111481

--- Comment #217 from Shmerl <shtetldik@gmail.com> ---
(In reply to lptech1024 from comment #216)
>
>Hang occurred during a gaming cutscene.
>=20
>...
> Nov 06 [SNIP] kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring
> gfx_0.0.0 timeout, signaled seq=3D2827901, emitted seq=3D2827903
> Nov 06 [SNIP] kernel: [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR*
> Waiting for fences timed out or interrupted!

If you can reproduce it, please report this to radeonsi bug tracker (and at=
tach
an apitrace please).

https://gitlab.freedesktop.org/mesa/mesa/issues

Also, please add details on what game it is (and etc.) here:

https://www.gamingonlinux.com/wiki/Mesa_Broken

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--157310402912.7acD.17356
Date: Thu, 7 Nov 2019 05:20:29 +0000
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
   title=3D"NEW - AMD Navi GPU frequent freezes on both Manjaro/Ubuntu with=
 kernel 5.3 and mesa 19.2 -git/llvm9"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481#c217">Comm=
ent # 217</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - AMD Navi GPU frequent freezes on both Manjaro/Ubuntu with=
 kernel 5.3 and mesa 19.2 -git/llvm9"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481">bug 11148=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
shtetldik&#64;gmail.com" title=3D"Shmerl &lt;shtetldik&#64;gmail.com&gt;"> =
<span class=3D"fn">Shmerl</span></a>
</span></b>
        <pre>(In reply to lptech1024 from <a href=3D"show_bug.cgi?id=3D1114=
81#c216">comment #216</a>)
&gt;
<span class=3D"quote">&gt;Hang occurred during a gaming cutscene.
&gt;=20
&gt;...
&gt; Nov 06 [SNIP] kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring
&gt; gfx_0.0.0 timeout, signaled seq=3D2827901, emitted seq=3D2827903
&gt; Nov 06 [SNIP] kernel: [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERR=
OR*
&gt; Waiting for fences timed out or interrupted!</span >

If you can reproduce it, please report this to radeonsi bug tracker (and at=
tach
an apitrace please).

<a href=3D"https://gitlab.freedesktop.org/mesa/mesa/issues">https://gitlab.=
freedesktop.org/mesa/mesa/issues</a>

Also, please add details on what game it is (and etc.) here:

<a href=3D"https://www.gamingonlinux.com/wiki/Mesa_Broken">https://www.gami=
ngonlinux.com/wiki/Mesa_Broken</a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--157310402912.7acD.17356--

--===============1905847623==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1905847623==--
