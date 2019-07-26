Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B0975C85
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 03:24:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2BE56E854;
	Fri, 26 Jul 2019 01:24:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7862D6E85A
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 01:24:46 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 711D872167; Fri, 26 Jul 2019 01:24:46 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110674] Crashes / Resets From AMDGPU / Radeon VII
Date: Fri, 26 Jul 2019 01:24:46 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: tom@r.je
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110674-502-wodpJxORZu@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1412097587=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1412097587==
Content-Type: multipart/alternative; boundary="15641042862.b550898f.600"
Content-Transfer-Encoding: 7bit


--15641042862.b550898f.600
Date: Fri, 26 Jul 2019 01:24:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110674

--- Comment #49 from Tom B <tom@r.je> ---
Unfortunately iGPU isn't an option for me as I don't have one.=20

> I'm able to run dual monitors with one HDMI and one DP.

> Running 3 monitors (2 DP 1 HDMI) at 1440p 144Hz causes all the issues not=
ed here. Linux 5.2.2

That's interesting, as I was originally using HDMI + DP but it caused its o=
wn
set of similar issues as reported here:
https://bugs.freedesktop.org/show_bug.cgi?id=3D110510=20

I wonder whether 5.1+ reversed it so that HDMI+DP now works, I'll test it w=
hen
I get a chance.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15641042862.b550898f.600
Date: Fri, 26 Jul 2019 01:24:46 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674#c49">Comme=
nt # 49</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Crashes / Resets From AMDGPU / Radeon VII"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674">bug 11067=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
tom&#64;r.je" title=3D"Tom B &lt;tom&#64;r.je&gt;"> <span class=3D"fn">Tom =
B</span></a>
</span></b>
        <pre>Unfortunately iGPU isn't an option for me as I don't have one.=
=20

<span class=3D"quote">&gt; I'm able to run dual monitors with one HDMI and =
one DP.</span >

<span class=3D"quote">&gt; Running 3 monitors (2 DP 1 HDMI) at 1440p 144Hz =
causes all the issues noted here. Linux 5.2.2</span >

That's interesting, as I was originally using HDMI + DP but it caused its o=
wn
set of similar issues as reported here:
<a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Radeon VII HDMI issues: Flicking/system crashing"
   href=3D"show_bug.cgi?id=3D110510">https://bugs.freedesktop.org/show_bug.=
cgi?id=3D110510</a>=20

I wonder whether 5.1+ reversed it so that HDMI+DP now works, I'll test it w=
hen
I get a chance.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15641042862.b550898f.600--

--===============1412097587==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1412097587==--
