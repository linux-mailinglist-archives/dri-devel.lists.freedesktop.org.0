Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5E07C6E8
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2019 17:38:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29A1289C88;
	Wed, 31 Jul 2019 15:37:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id B9E1589F19
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2019 15:37:56 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id B6AFE72167; Wed, 31 Jul 2019 15:37:56 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110674] Crashes / Resets From AMDGPU / Radeon VII
Date: Wed, 31 Jul 2019 15:37:56 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: ted437@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110674-502-3bjbBFp8c0@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110674-502@http.bugs.freedesktop.org/>
References: <bug-110674-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1555359174=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1555359174==
Content-Type: multipart/alternative; boundary="15645874764.b2bd.19631"
Content-Transfer-Encoding: 7bit


--15645874764.b2bd.19631
Date: Wed, 31 Jul 2019 15:37:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110674

--- Comment #55 from Anthony Rabbito <ted437@gmail.com> ---
(In reply to ReddestDream from comment #54)
> (In reply to Peter Hercek from comment #52)
> > I'm getting hangs-up with kernels 5.2.3 (often) and 5.1.15 (less often).
> > Radeon VII with 3 monitors. Each monitor connected through DP.
>=20
> I hear that 5.0.0.13 is from before this regression and should work witho=
ut
> issue if you are willing to downgrade:
>=20
> https://bbs.archlinux.org/viewtopic.php?id=3D247733
>=20
> (In reply to Anthony Rabbito from comment #53)
> > Interesting, on 5.2.x with 2 monitors hooked up via HDMI and DP it beha=
ves
> > 75% of the time with most issues coming from xinit or sleep. Hopefully =
5.3
> > will contain fixes
>=20
> Would be interesting if it turns out that using HDMI+DP fixes the issue. =
Not
> that HDMI doesn't come with its own issues sometimes with color. I do have
> some faith that 5.3 will fix it since AMDGPU is getting a lot of work for
> Navi. I plan to try out 5.3-rc2 (or whatever mainline is at) sometime this
> week.

I will check my package cache to see of I still have kernel 5.0.0.13 to see=
 if
it's available to me otherwise I'll build it. I'll report back how it goes.=
 I
miss my third monitor.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15645874764.b2bd.19631
Date: Wed, 31 Jul 2019 15:37:56 +0000
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
   title=3D"NEW - Crashes / Resets From AMDGPU / Radeon VII"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674#c55">Comme=
nt # 55</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Crashes / Resets From AMDGPU / Radeon VII"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674">bug 11067=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
ted437&#64;gmail.com" title=3D"Anthony Rabbito &lt;ted437&#64;gmail.com&gt;=
"> <span class=3D"fn">Anthony Rabbito</span></a>
</span></b>
        <pre>(In reply to ReddestDream from <a href=3D"show_bug.cgi?id=3D11=
0674#c54">comment #54</a>)
<span class=3D"quote">&gt; (In reply to Peter Hercek from <a href=3D"show_b=
ug.cgi?id=3D110674#c52">comment #52</a>)
&gt; &gt; I'm getting hangs-up with kernels 5.2.3 (often) and 5.1.15 (less =
often).
&gt; &gt; Radeon VII with 3 monitors. Each monitor connected through DP.
&gt;=20
&gt; I hear that 5.0.0.13 is from before this regression and should work wi=
thout
&gt; issue if you are willing to downgrade:
&gt;=20
&gt; <a href=3D"https://bbs.archlinux.org/viewtopic.php?id=3D247733">https:=
//bbs.archlinux.org/viewtopic.php?id=3D247733</a>
&gt;=20
&gt; (In reply to Anthony Rabbito from <a href=3D"show_bug.cgi?id=3D110674#=
c53">comment #53</a>)
&gt; &gt; Interesting, on 5.2.x with 2 monitors hooked up via HDMI and DP i=
t behaves
&gt; &gt; 75% of the time with most issues coming from xinit or sleep. Hope=
fully 5.3
&gt; &gt; will contain fixes
&gt;=20
&gt; Would be interesting if it turns out that using HDMI+DP fixes the issu=
e. Not
&gt; that HDMI doesn't come with its own issues sometimes with color. I do =
have
&gt; some faith that 5.3 will fix it since AMDGPU is getting a lot of work =
for
&gt; Navi. I plan to try out 5.3-rc2 (or whatever mainline is at) sometime =
this
&gt; week.</span >

I will check my package cache to see of I still have kernel 5.0.0.13 to see=
 if
it's available to me otherwise I'll build it. I'll report back how it goes.=
 I
miss my third monitor.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15645874764.b2bd.19631--

--===============1555359174==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1555359174==--
