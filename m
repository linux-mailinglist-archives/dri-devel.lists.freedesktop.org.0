Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6120FD5E69
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2019 11:15:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98A6D893DB;
	Mon, 14 Oct 2019 09:15:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1C60A8938C
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 09:15:30 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 188997296E; Mon, 14 Oct 2019 09:15:30 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110674] Crashes / Resets From AMDGPU / Radeon VII
Date: Mon, 14 Oct 2019 09:15:30 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: linedot@xcpp.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: FIXED
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-110674-502-NqbtExeYAj@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1401021299=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1401021299==
Content-Type: multipart/alternative; boundary="15710445300.e5BDaA7b.11305"
Content-Transfer-Encoding: 7bit


--15710445300.e5BDaA7b.11305
Date: Mon, 14 Oct 2019 09:15:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110674

--- Comment #162 from linedot@xcpp.org ---
Created attachment 145730
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145730&action=3Dedit
Freeze/Black screen/Crash on 5.3.6

Apologies, I have been on vacation and thus away from my main System.

Attached is the dmesg log of another crash with kernel version 5.3.6. Here =
is a
description of what the crash looked like:
1) Successfully booted up to login manager
2) Logged into a graphical session
3) Shortly after, the screen freezes
4) Screen flashes to black (~5-10 sec)
5) Screen flashes back to the frozen desktop (~5-10 sec)
6) Screen goes black (not off), no response to input, switching to tty does=
n't
work. I was able to ssh into the machine from a laptop and get the dmesg
output.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15710445300.e5BDaA7b.11305
Date: Mon, 14 Oct 2019 09:15:30 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674#c162">Comm=
ent # 162</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - Crashes / Resets From AMDGPU / Radeon VII"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674">bug 11067=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
linedot&#64;xcpp.org" title=3D"linedot&#64;xcpp.org">linedot&#64;xcpp.org</=
a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145730=
" name=3D"attach_145730" title=3D"Freeze/Black screen/Crash on 5.3.6">attac=
hment 145730</a> <a href=3D"attachment.cgi?id=3D145730&amp;action=3Dedit" t=
itle=3D"Freeze/Black screen/Crash on 5.3.6">[details]</a></span>
Freeze/Black screen/Crash on 5.3.6

Apologies, I have been on vacation and thus away from my main System.

Attached is the dmesg log of another crash with kernel version 5.3.6. Here =
is a
description of what the crash looked like:
1) Successfully booted up to login manager
2) Logged into a graphical session
3) Shortly after, the screen freezes
4) Screen flashes to black (~5-10 sec)
5) Screen flashes back to the frozen desktop (~5-10 sec)
6) Screen goes black (not off), no response to input, switching to tty does=
n't
work. I was able to ssh into the machine from a laptop and get the dmesg
output.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15710445300.e5BDaA7b.11305--

--===============1401021299==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1401021299==--
