Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 785D1F0C32
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2019 03:46:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 680076EBCB;
	Wed,  6 Nov 2019 02:46:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id D2BF86EBD5
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2019 02:46:03 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id CF79C720E2; Wed,  6 Nov 2019 02:46:03 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109955] amdgpu [RX Vega 64] system freeze while gaming
Date: Wed, 06 Nov 2019 02:46:02 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: rodamorris@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-109955-502-2g0PrW40tI@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1750861756=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1750861756==
Content-Type: multipart/alternative; boundary="157300836310.5934f1E.22508"
Content-Transfer-Encoding: 7bit


--157300836310.5934f1E.22508
Date: Wed, 6 Nov 2019 02:46:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109955

--- Comment #126 from Rodney A Morris <rodamorris@gmail.com> ---
(In reply to haro41 from comment #125)
> ... thanks for your feedback, so it seems we are faced with the same bug =
...
>=20
> Btw, i got crashes with at least one vulkan game and ACO compiler backend
> enabled too.
> I think it really depends of the load pattern. And enabled vsync is
> triggering the typical load pattern, with at least one transient (from hi=
gh
> to low load) per frame.
>=20
> Is someone affected with this bug here, usually building the kernel from
> source locally?

If you want someone to apply your changes in bug report no. 110777 to the
kernel for testing, I can so but will not be to it until this weekend.=20

As a side note, I've had great success manually limiting the memory clock to
level 1,2,3 on my Vega 64.  I've played over 7 hours of Stellaris without a
crash.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--157300836310.5934f1E.22508
Date: Wed, 6 Nov 2019 02:46:03 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109955#c126">Comm=
ent # 126</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - amdgpu [RX Vega 64] system freeze while gaming"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109955">bug 10995=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
rodamorris&#64;gmail.com" title=3D"Rodney A Morris &lt;rodamorris&#64;gmail=
.com&gt;"> <span class=3D"fn">Rodney A Morris</span></a>
</span></b>
        <pre>(In reply to haro41 from <a href=3D"show_bug.cgi?id=3D109955#c=
125">comment #125</a>)
<span class=3D"quote">&gt; ... thanks for your feedback, so it seems we are=
 faced with the same bug ...
&gt;=20
&gt; Btw, i got crashes with at least one vulkan game and ACO compiler back=
end
&gt; enabled too.
&gt; I think it really depends of the load pattern. And enabled vsync is
&gt; triggering the typical load pattern, with at least one transient (from=
 high
&gt; to low load) per frame.
&gt;=20
&gt; Is someone affected with this bug here, usually building the kernel fr=
om
&gt; source locally?</span >

If you want someone to apply your changes in bug report no. 110777 to the
kernel for testing, I can so but will not be to it until this weekend.=20

As a side note, I've had great success manually limiting the memory clock to
level 1,2,3 on my Vega 64.  I've played over 7 hours of Stellaris without a
crash.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--157300836310.5934f1E.22508--

--===============1750861756==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1750861756==--
