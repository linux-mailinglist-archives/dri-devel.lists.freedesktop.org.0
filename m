Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B59B1694
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2019 01:09:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E3376EE57;
	Thu, 12 Sep 2019 23:09:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1B3C26EE5C
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2019 23:09:47 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 1883572167; Thu, 12 Sep 2019 23:09:47 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 102322] System crashes after "[drm] IP block:gmc_v8_0 is hung!"
 / [drm] IP block:sdma_v3_0 is hung!
Date: Thu, 12 Sep 2019 23:09:47 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: jb5sgc1n.nya@20mm.eu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-102322-502-mHvKvwrgme@http.bugs.freedesktop.org/>
In-Reply-To: <bug-102322-502@http.bugs.freedesktop.org/>
References: <bug-102322-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0639816094=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0639816094==
Content-Type: multipart/alternative; boundary="15683297871.8Dc3.29441"
Content-Transfer-Encoding: 7bit


--15683297871.8Dc3.29441
Date: Thu, 12 Sep 2019 23:09:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D102322

--- Comment #87 from dwagner <jb5sgc1n.nya@20mm.eu> ---
(In reply to Paul Ezvan from comment #86)
> My hypothesis on this problem not being easily reproducible is that it wo=
uld
> happen only on specific GPU/CPU combinations.

... and at least a specific operating system (Linux) and a specific driver
(amdgpu with dc=3D1).

If your hypothesis was true - do you suggest everyone plagued by this bug j=
ust
buys a new main-board and an Intel CPU to evade it?

Since my Ryzen system is perfectly stable when used as a server, not displa=
ying
anything but the text console, I'm inclined to rather keep my main-board and
CPU and just exchange the GPU for another brand that comes with stable driv=
ers.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15683297871.8Dc3.29441
Date: Thu, 12 Sep 2019 23:09:47 +0000
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
   title=3D"NEW - System crashes after &quot;[drm] IP block:gmc_v8_0 is hun=
g!&quot; / [drm] IP block:sdma_v3_0 is hung!"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D102322#c87">Comme=
nt # 87</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - System crashes after &quot;[drm] IP block:gmc_v8_0 is hun=
g!&quot; / [drm] IP block:sdma_v3_0 is hung!"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D102322">bug 10232=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
jb5sgc1n.nya&#64;20mm.eu" title=3D"dwagner &lt;jb5sgc1n.nya&#64;20mm.eu&gt;=
"> <span class=3D"fn">dwagner</span></a>
</span></b>
        <pre>(In reply to Paul Ezvan from <a href=3D"show_bug.cgi?id=3D1023=
22#c86">comment #86</a>)
<span class=3D"quote">&gt; My hypothesis on this problem not being easily r=
eproducible is that it would
&gt; happen only on specific GPU/CPU combinations.</span >

... and at least a specific operating system (Linux) and a specific driver
(amdgpu with dc=3D1).

If your hypothesis was true - do you suggest everyone plagued by this bug j=
ust
buys a new main-board and an Intel CPU to evade it?

Since my Ryzen system is perfectly stable when used as a server, not displa=
ying
anything but the text console, I'm inclined to rather keep my main-board and
CPU and just exchange the GPU for another brand that comes with stable driv=
ers.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15683297871.8Dc3.29441--

--===============0639816094==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0639816094==--
