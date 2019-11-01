Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B85EC975
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2019 21:16:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52A036F86A;
	Fri,  1 Nov 2019 20:16:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id B6A456F867
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2019 20:16:04 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id B2BF2720E2; Fri,  1 Nov 2019 20:16:04 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111481] AMD Navi GPU frequent freezes on both Manjaro/Ubuntu
 with kernel 5.3 and mesa 19.2 -git/llvm9
Date: Fri, 01 Nov 2019 20:16:04 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: pseus7@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: highest
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111481-502-aLxuXhCiwy@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0386243639=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0386243639==
Content-Type: multipart/alternative; boundary="15726393641.230CAb07.28896"
Content-Transfer-Encoding: 7bit


--15726393641.230CAb07.28896
Date: Fri, 1 Nov 2019 20:16:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111481

--- Comment #192 from Seba Pe <pseus7@gmail.com> ---
(In reply to L.S.S. from comment #188)
> Not sure where the problem might be.
>=20
> After installing 5.4-rc5, in addition to amdgpu-pro-libgl (and other
> amdgpu-pro related stuffs), I stopped encountering those dreaded "ring sd=
ma0
> timeout" freezes when using Nemo. I think amdgpu-pro stuffs might be what
> "fixed" it.
>=20
> I'll test this for the time being. I cannot be confident that it would be
> completely fixed this way, but at least the situation has been improved to
> the point that Nemo is now usable again.

As I said in comment #149
(https://bugs.freedesktop.org/show_bug.cgi?id=3D111481#c149), amdgpu-pro do=
es not
exhibit freezes or timeouts.

This appears to point to a problem in the generated instructions from libgl=
 (or
potentially a combination of that plus an underlying issue in the kernel
driver).

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15726393641.230CAb07.28896
Date: Fri, 1 Nov 2019 20:16:04 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481#c192">Comm=
ent # 192</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - AMD Navi GPU frequent freezes on both Manjaro/Ubuntu with=
 kernel 5.3 and mesa 19.2 -git/llvm9"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481">bug 11148=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
pseus7&#64;gmail.com" title=3D"Seba Pe &lt;pseus7&#64;gmail.com&gt;"> <span=
 class=3D"fn">Seba Pe</span></a>
</span></b>
        <pre>(In reply to L.S.S. from <a href=3D"show_bug.cgi?id=3D111481#c=
188">comment #188</a>)
<span class=3D"quote">&gt; Not sure where the problem might be.
&gt;=20
&gt; After installing 5.4-rc5, in addition to amdgpu-pro-libgl (and other
&gt; amdgpu-pro related stuffs), I stopped encountering those dreaded &quot=
;ring sdma0
&gt; timeout&quot; freezes when using Nemo. I think amdgpu-pro stuffs might=
 be what
&gt; &quot;fixed&quot; it.
&gt;=20
&gt; I'll test this for the time being. I cannot be confident that it would=
 be
&gt; completely fixed this way, but at least the situation has been improve=
d to
&gt; the point that Nemo is now usable again.</span >

As I said in <a href=3D"show_bug.cgi?id=3D111481#c149">comment #149</a>
(<a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - AMD Navi GPU frequent freezes on both Manjaro/Ubuntu with=
 kernel 5.3 and mesa 19.2 -git/llvm9"
   href=3D"show_bug.cgi?id=3D111481#c149">https://bugs.freedesktop.org/show=
_bug.cgi?id=3D111481#c149</a>), amdgpu-pro does not
exhibit freezes or timeouts.

This appears to point to a problem in the generated instructions from libgl=
 (or
potentially a combination of that plus an underlying issue in the kernel
driver).</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15726393641.230CAb07.28896--

--===============0386243639==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0386243639==--
