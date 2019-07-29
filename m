Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C5279B4D
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2019 23:40:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F8636E2B6;
	Mon, 29 Jul 2019 21:40:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id AE8E76E2B1
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2019 21:40:21 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id AB43D72167; Mon, 29 Jul 2019 21:40:21 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110674] Crashes / Resets From AMDGPU / Radeon VII
Date: Mon, 29 Jul 2019 21:40:21 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: reddestdream@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110674-502-jrDRVTRsDO@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1965934067=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1965934067==
Content-Type: multipart/alternative; boundary="15644364212.aFFAFd0E.21872"
Content-Transfer-Encoding: 7bit


--15644364212.aFFAFd0E.21872
Date: Mon, 29 Jul 2019 21:40:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110674

--- Comment #54 from ReddestDream <reddestdream@gmail.com> ---
(In reply to Peter Hercek from comment #52)
> I'm getting hangs-up with kernels 5.2.3 (often) and 5.1.15 (less often).
> Radeon VII with 3 monitors. Each monitor connected through DP.

I hear that 5.0.0.13 is from before this regression and should work without
issue if you are willing to downgrade:

https://bbs.archlinux.org/viewtopic.php?id=3D247733

(In reply to Anthony Rabbito from comment #53)
> Interesting, on 5.2.x with 2 monitors hooked up via HDMI and DP it behaves
> 75% of the time with most issues coming from xinit or sleep. Hopefully 5.3
> will contain fixes

Would be interesting if it turns out that using HDMI+DP fixes the issue. Not
that HDMI doesn't come with its own issues sometimes with color. I do have =
some
faith that 5.3 will fix it since AMDGPU is getting a lot of work for Navi. I
plan to try out 5.3-rc2 (or whatever mainline is at) sometime this week.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15644364212.aFFAFd0E.21872
Date: Mon, 29 Jul 2019 21:40:21 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674#c54">Comme=
nt # 54</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Crashes / Resets From AMDGPU / Radeon VII"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674">bug 11067=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
reddestdream&#64;gmail.com" title=3D"ReddestDream &lt;reddestdream&#64;gmai=
l.com&gt;"> <span class=3D"fn">ReddestDream</span></a>
</span></b>
        <pre>(In reply to Peter Hercek from <a href=3D"show_bug.cgi?id=3D11=
0674#c52">comment #52</a>)
<span class=3D"quote">&gt; I'm getting hangs-up with kernels 5.2.3 (often) =
and 5.1.15 (less often).
&gt; Radeon VII with 3 monitors. Each monitor connected through DP.</span >

I hear that 5.0.0.13 is from before this regression and should work without
issue if you are willing to downgrade:

<a href=3D"https://bbs.archlinux.org/viewtopic.php?id=3D247733">https://bbs=
.archlinux.org/viewtopic.php?id=3D247733</a>

(In reply to Anthony Rabbito from <a href=3D"show_bug.cgi?id=3D110674#c53">=
comment #53</a>)
<span class=3D"quote">&gt; Interesting, on 5.2.x with 2 monitors hooked up =
via HDMI and DP it behaves
&gt; 75% of the time with most issues coming from xinit or sleep. Hopefully=
 5.3
&gt; will contain fixes</span >

Would be interesting if it turns out that using HDMI+DP fixes the issue. Not
that HDMI doesn't come with its own issues sometimes with color. I do have =
some
faith that 5.3 will fix it since AMDGPU is getting a lot of work for Navi. I
plan to try out 5.3-rc2 (or whatever mainline is at) sometime this week.</p=
re>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15644364212.aFFAFd0E.21872--

--===============1965934067==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1965934067==--
