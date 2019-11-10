Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D39F7F6933
	for <lists+dri-devel@lfdr.de>; Sun, 10 Nov 2019 14:56:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E42286E620;
	Sun, 10 Nov 2019 13:55:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id C278B6E620
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Nov 2019 13:55:58 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id B68E2720E2; Sun, 10 Nov 2019 13:55:58 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111763] ring_gfx hangs/freezes on Navi gpus
Date: Sun, 10 Nov 2019 13:55:58 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: popovic.marko@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111763-502-LeIyv8GUvB@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111763-502@http.bugs.freedesktop.org/>
References: <bug-111763-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0318522610=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0318522610==
Content-Type: multipart/alternative; boundary="15733941580.e7de7B2ad.17802"
Content-Transfer-Encoding: 7bit


--15733941580.e7de7B2ad.17802
Date: Sun, 10 Nov 2019 13:55:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111763

--- Comment #32 from Marko Popovic <popovic.marko@protonmail.com> ---
(In reply to Daniel Suarez from comment #31)
> (In reply to Marko Popovic from comment #30)
> > (In reply to Daniel Suarez from comment #29)
> > > (In reply to Marko Popovic from comment #28)
> > > > I think this bug report can be closed now, Mesa 20 git basically fi=
xes radv
> > > > related ring_gfx hangs, there is still hang that happens in Citra e=
mulator
> > > > (ngg related) but AMD developers are aware of it so will probably g=
et fixed
> > > > too.
> > >=20
> > > Yeah.. "soon". Still waiting for them to fix bug 111481
> >=20
> > SDMA hangs have nothing to do with ring_gfx hangs which were mostly radv
> > related and are fixed now
>=20
> Still, I can't even play Vulkan titles reliably because the system
> constantly hangs even with the workarounds in the bug report. AMD really
> needs to fix them.

Mesa 20.0 should fix Vulkan hangs for you, and with nodma SDMA is disabled
fully so you can't get any hangs that are SDMA related.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15733941580.e7de7B2ad.17802
Date: Sun, 10 Nov 2019 13:55:58 +0000
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
   title=3D"NEW - ring_gfx hangs/freezes on Navi gpus"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111763#c32">Comme=
nt # 32</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - ring_gfx hangs/freezes on Navi gpus"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111763">bug 11176=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
popovic.marko&#64;protonmail.com" title=3D"Marko Popovic &lt;popovic.marko&=
#64;protonmail.com&gt;"> <span class=3D"fn">Marko Popovic</span></a>
</span></b>
        <pre>(In reply to Daniel Suarez from <a href=3D"show_bug.cgi?id=3D1=
11763#c31">comment #31</a>)
<span class=3D"quote">&gt; (In reply to Marko Popovic from <a href=3D"show_=
bug.cgi?id=3D111763#c30">comment #30</a>)
&gt; &gt; (In reply to Daniel Suarez from <a href=3D"show_bug.cgi?id=3D1117=
63#c29">comment #29</a>)
&gt; &gt; &gt; (In reply to Marko Popovic from <a href=3D"show_bug.cgi?id=
=3D111763#c28">comment #28</a>)
&gt; &gt; &gt; &gt; I think this bug report can be closed now, Mesa 20 git =
basically fixes radv
&gt; &gt; &gt; &gt; related ring_gfx hangs, there is still hang that happen=
s in Citra emulator
&gt; &gt; &gt; &gt; (ngg related) but AMD developers are aware of it so wil=
l probably get fixed
&gt; &gt; &gt; &gt; too.
&gt; &gt; &gt;=20
&gt; &gt; &gt; Yeah.. &quot;soon&quot;. Still waiting for them to fix <a cl=
ass=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - AMD Navi GPU frequent freezes on both Manjaro/Ubuntu with=
 kernel 5.3 and mesa 19.2 -git/llvm9"
   href=3D"show_bug.cgi?id=3D111481">bug 111481</a>
&gt; &gt;=20
&gt; &gt; SDMA hangs have nothing to do with ring_gfx hangs which were most=
ly radv
&gt; &gt; related and are fixed now
&gt;=20
&gt; Still, I can't even play Vulkan titles reliably because the system
&gt; constantly hangs even with the workarounds in the bug report. AMD real=
ly
&gt; needs to fix them.</span >

Mesa 20.0 should fix Vulkan hangs for you, and with nodma SDMA is disabled
fully so you can't get any hangs that are SDMA related.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15733941580.e7de7B2ad.17802--

--===============0318522610==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0318522610==--
