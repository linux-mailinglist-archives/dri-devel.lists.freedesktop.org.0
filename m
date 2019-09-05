Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41CA7AA106
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2019 13:14:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 548A3893B9;
	Thu,  5 Sep 2019 11:14:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 28B468934F
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2019 11:14:41 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 1C7B072161; Thu,  5 Sep 2019 11:14:41 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111481] AMD Navi GPU frequent freezes on both Manjaro/Ubuntu
 with kernel 5.3 and mesa 19.2 -git/llvm9
Date: Thu, 05 Sep 2019 11:14:41 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: popovic.marko@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111481-502-JaTGdVwCZ7@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0601129859=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0601129859==
Content-Type: multipart/alternative; boundary="15676820800.dcDAf2a1.4912"
Content-Transfer-Encoding: 7bit


--15676820800.dcDAf2a1.4912
Date: Thu, 5 Sep 2019 11:14:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111481

--- Comment #29 from Marko Popovic <popovic.marko@protonmail.com> ---
(In reply to Mathieu Belanger from comment #27)
> It did fix it for me too.

(In reply to Pierre-Eric Pelloux-Prayer from comment #28)
> Regarding sdma ring hangs: if you still have access to the affected machi=
ne
> using ssh, it would be helpful to add a comment with the following
> information:
>=20
>   - the last dmesg lines (at least the "[drm:amdgpu_job_timedout [amdgpu]]
> *ERROR* ring sdma1 timeout, signaled seq=3D9871, emitted seq=3D9873" one)
>   - the output of : umr -R sdma0 (or sdma1 depending on which one failed)
>=20
> Thanks!

Mathieu could you assist Pierre-Eric with this?=20
I am currently on vacation and won't be able to debug or test further until
15th of September.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15676820800.dcDAf2a1.4912
Date: Thu, 5 Sep 2019 11:14:40 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481#c29">Comme=
nt # 29</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - AMD Navi GPU frequent freezes on both Manjaro/Ubuntu with=
 kernel 5.3 and mesa 19.2 -git/llvm9"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481">bug 11148=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
popovic.marko&#64;protonmail.com" title=3D"Marko Popovic &lt;popovic.marko&=
#64;protonmail.com&gt;"> <span class=3D"fn">Marko Popovic</span></a>
</span></b>
        <pre>(In reply to Mathieu Belanger from <a href=3D"show_bug.cgi?id=
=3D111481#c27">comment #27</a>)
<span class=3D"quote">&gt; It did fix it for me too.</span >

(In reply to Pierre-Eric Pelloux-Prayer from <a href=3D"show_bug.cgi?id=3D1=
11481#c28">comment #28</a>)
<span class=3D"quote">&gt; Regarding sdma ring hangs: if you still have acc=
ess to the affected machine
&gt; using ssh, it would be helpful to add a comment with the following
&gt; information:
&gt;=20
&gt;   - the last dmesg lines (at least the &quot;[drm:amdgpu_job_timedout =
[amdgpu]]
&gt; *ERROR* ring sdma1 timeout, signaled seq=3D9871, emitted seq=3D9873&qu=
ot; one)
&gt;   - the output of : umr -R sdma0 (or sdma1 depending on which one fail=
ed)
&gt;=20
&gt; Thanks!</span >

Mathieu could you assist Pierre-Eric with this?=20
I am currently on vacation and won't be able to debug or test further until
15th of September.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15676820800.dcDAf2a1.4912--

--===============0601129859==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0601129859==--
