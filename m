Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7335522959
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2019 00:37:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D1F0891A4;
	Sun, 19 May 2019 22:37:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 964EA891A8
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2019 22:37:39 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 9286C72167; Sun, 19 May 2019 22:37:39 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110674] Crashes / Resets From AMDGPU / Radeon VII
Date: Sun, 19 May 2019 22:37:39 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: hameerabbasi@yahoo.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110674-502-QQp4pttpPc@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1831565228=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1831565228==
Content-Type: multipart/alternative; boundary="15583054592.ba6CFB4c.19762"
Content-Transfer-Encoding: 7bit


--15583054592.ba6CFB4c.19762
Date: Sun, 19 May 2019 22:37:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110674

--- Comment #24 from Hameer Abbasi <hameerabbasi@yahoo.com> ---
> I restarted thrice on 5.0.13, no issue.

Scratch that... I get minor corruption even on 5.0.13 on accelerated video
playback during high CPU usage (such as compilation). The videos freeze, gl=
itch
out, and sometimes there's graphical corruption.

> I am running two 4k 60hz monitors without Freesync. The only common facto=
r there is that we are both running two displays. Both of mine are DisplayP=
ort.

Not the only thing... We're both doing similar amounts of pixels per second=
, in
a sense, more or less. Mine are DisplayPort too, so that's also common for =
us.

I'm on GNOME desktop and the entire GNOME suite.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15583054592.ba6CFB4c.19762
Date: Sun, 19 May 2019 22:37:39 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674#c24">Comme=
nt # 24</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Crashes / Resets From AMDGPU / Radeon VII"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674">bug 11067=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
hameerabbasi&#64;yahoo.com" title=3D"Hameer Abbasi &lt;hameerabbasi&#64;yah=
oo.com&gt;"> <span class=3D"fn">Hameer Abbasi</span></a>
</span></b>
        <pre><span class=3D"quote">&gt; I restarted thrice on 5.0.13, no is=
sue.</span >

Scratch that... I get minor corruption even on 5.0.13 on accelerated video
playback during high CPU usage (such as compilation). The videos freeze, gl=
itch
out, and sometimes there's graphical corruption.

<span class=3D"quote">&gt; I am running two 4k 60hz monitors without Freesy=
nc. The only common factor there is that we are both running two displays. =
Both of mine are DisplayPort.</span >

Not the only thing... We're both doing similar amounts of pixels per second=
, in
a sense, more or less. Mine are DisplayPort too, so that's also common for =
us.

I'm on GNOME desktop and the entire GNOME suite.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15583054592.ba6CFB4c.19762--

--===============1831565228==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1831565228==--
