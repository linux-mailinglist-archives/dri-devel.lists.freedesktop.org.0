Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EAE3A539E
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 12:07:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7CF389935;
	Mon,  2 Sep 2019 10:07:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 73BEA89906
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2019 10:07:42 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 7011B72161; Mon,  2 Sep 2019 10:07:42 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109955] amdgpu [RX Vega 64] system freeze while gaming
Date: Mon, 02 Sep 2019 10:07:42 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ilvipero@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-109955-502-GzJcdYRPjr@http.bugs.freedesktop.org/>
In-Reply-To: <bug-109955-502@http.bugs.freedesktop.org/>
References: <bug-109955-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0244373441=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0244373441==
Content-Type: multipart/alternative; boundary="15674188620.03AFc.7974"
Content-Transfer-Encoding: 7bit


--15674188620.03AFc.7974
Date: Mon, 2 Sep 2019 10:07:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109955

--- Comment #94 from Mauro Gaspari <ilvipero@gmx.com> ---
(In reply to Wilko Bartels from comment #93)
> (In reply to Wilko Bartels from comment #91)
> > how big are your swap partitions guys? just toying around here :-)
>=20
> also i wanna know if anyone else on arch tested the amdgpu-pro yet?
> i played only 3 hours now. we all know that doesnt mean anything :-)
> but fingers crossed.
> i also have no idea how to confirm its even used. the kernel module showi=
ng
> amdgpu in both circumstances right?

Hello,
I am testing on multiple distributions with different mesa drivers. Swap si=
ze
is 2GB to 8GB depending on the distro. Having 64GB RAM, my swap is constant=
ly
empty.
So far the best performance I have is on ubuntu budgie 18.04 with MESA-ACO
released by Valve. I had no crashes in quite some time. But I did not have =
much
time to play lately, so I need more time to test.

Regarding AMDGPU-PRO, I tested on ubuntu a very long time ago, and it was q=
uite
bad. But I think it makes sense to test and compare. I will install another
ubuntu budgie 18.04 on a separate SSD and use it with AMDGPU-PRO. and see if
the same issues are shared with AMDGPU, or not.

Thanks, and let me know how AMDGPU-PRO works on arch.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15674188620.03AFc.7974
Date: Mon, 2 Sep 2019 10:07:42 +0000
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
   title=3D"NEW - amdgpu [RX Vega 64] system freeze while gaming"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109955#c94">Comme=
nt # 94</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - amdgpu [RX Vega 64] system freeze while gaming"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109955">bug 10995=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
ilvipero&#64;gmx.com" title=3D"Mauro Gaspari &lt;ilvipero&#64;gmx.com&gt;">=
 <span class=3D"fn">Mauro Gaspari</span></a>
</span></b>
        <pre>(In reply to Wilko Bartels from <a href=3D"show_bug.cgi?id=3D1=
09955#c93">comment #93</a>)
<span class=3D"quote">&gt; (In reply to Wilko Bartels from <a href=3D"show_=
bug.cgi?id=3D109955#c91">comment #91</a>)
&gt; &gt; how big are your swap partitions guys? just toying around here :-)
&gt;=20
&gt; also i wanna know if anyone else on arch tested the amdgpu-pro yet?
&gt; i played only 3 hours now. we all know that doesnt mean anything :-)
&gt; but fingers crossed.
&gt; i also have no idea how to confirm its even used. the kernel module sh=
owing
&gt; amdgpu in both circumstances right?</span >

Hello,
I am testing on multiple distributions with different mesa drivers. Swap si=
ze
is 2GB to 8GB depending on the distro. Having 64GB RAM, my swap is constant=
ly
empty.
So far the best performance I have is on ubuntu budgie 18.04 with MESA-ACO
released by Valve. I had no crashes in quite some time. But I did not have =
much
time to play lately, so I need more time to test.

Regarding AMDGPU-PRO, I tested on ubuntu a very long time ago, and it was q=
uite
bad. But I think it makes sense to test and compare. I will install another
ubuntu budgie 18.04 on a separate SSD and use it with AMDGPU-PRO. and see if
the same issues are shared with AMDGPU, or not.

Thanks, and let me know how AMDGPU-PRO works on arch.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15674188620.03AFc.7974--

--===============0244373441==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0244373441==--
