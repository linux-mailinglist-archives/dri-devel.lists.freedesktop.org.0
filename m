Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C479CBABD
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2019 14:43:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E6216EB75;
	Fri,  4 Oct 2019 12:43:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4BE986EB6F
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2019 12:43:36 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 48EA472162; Fri,  4 Oct 2019 12:43:36 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110674] Crashes / Resets From AMDGPU / Radeon VII
Date: Fri, 04 Oct 2019 12:43:36 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: reddestdream@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: FIXED
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110674-502-BmUiN8wMvE@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0635051177=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0635051177==
Content-Type: multipart/alternative; boundary="15701930163.42Ffc.15062"
Content-Transfer-Encoding: 7bit


--15701930163.42Ffc.15062
Date: Fri, 4 Oct 2019 12:43:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110674

--- Comment #155 from ReddestDream <reddestdream@gmail.com> ---
So, I've done some tests with 5.4-rc1 and it seems like I'm getting similar
results to linedot@xcpp.org and sehellion@gmail.com. I'm using GNOME with
Wayland (which works fine with only 1 display). Sometimes it works for a wh=
ile.
Sometimes I can't see the mouse cursor. Sometimes I get glitches all over t=
he
screen containing pieces and parts of previous framebuffers. But, I mean, i=
t's
better than 5.3 was, which was so bad I never could see anything and I would
get stuck on blackscreen. At least on 5.4-rc1 I've been able to manually sw=
itch
to a virtual console and reboot rather than force a reboot with the power
button.

Still hoping for some fix for this, but it's become less important to me as
further improvements to GNOME and MESA have made the Radeon VII + iGPU setup
I've been using run smoother. I've also discovered further issues on Windows
regarding the high memory clock when using multiple monitors with Radeon VI=
I,
and it's been affecting performance there too. I'm considering just sticking
with 1 monitor only with for this machine/card. lol

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15701930163.42Ffc.15062
Date: Fri, 4 Oct 2019 12:43:36 +0000
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
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - Crashes / Resets From AMDGPU / Radeon VII"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674#c155">Comm=
ent # 155</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - Crashes / Resets From AMDGPU / Radeon VII"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674">bug 11067=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
reddestdream&#64;gmail.com" title=3D"ReddestDream &lt;reddestdream&#64;gmai=
l.com&gt;"> <span class=3D"fn">ReddestDream</span></a>
</span></b>
        <pre>So, I've done some tests with 5.4-rc1 and it seems like I'm ge=
tting similar
results to <a href=3D"mailto:linedot&#64;xcpp.org">linedot&#64;xcpp.org</a>=
 and <a href=3D"mailto:sehellion&#64;gmail.com">sehellion&#64;gmail.com</a>=
. I'm using GNOME with
Wayland (which works fine with only 1 display). Sometimes it works for a wh=
ile.
Sometimes I can't see the mouse cursor. Sometimes I get glitches all over t=
he
screen containing pieces and parts of previous framebuffers. But, I mean, i=
t's
better than 5.3 was, which was so bad I never could see anything and I would
get stuck on blackscreen. At least on 5.4-rc1 I've been able to manually sw=
itch
to a virtual console and reboot rather than force a reboot with the power
button.

Still hoping for some fix for this, but it's become less important to me as
further improvements to GNOME and MESA have made the Radeon VII + iGPU setup
I've been using run smoother. I've also discovered further issues on Windows
regarding the high memory clock when using multiple monitors with Radeon VI=
I,
and it's been affecting performance there too. I'm considering just sticking
with 1 monitor only with for this machine/card. lol</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15701930163.42Ffc.15062--

--===============0635051177==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0635051177==--
