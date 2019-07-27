Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 708647790B
	for <lists+dri-devel@lfdr.de>; Sat, 27 Jul 2019 15:49:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 510366EEBF;
	Sat, 27 Jul 2019 13:49:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0C86D6EEBF
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jul 2019 13:49:00 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 08F4372168; Sat, 27 Jul 2019 13:49:00 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111231] random VM_L2_PROTECTION_FAULTs when loading a world in
 minetest on AMD ryzen 2200G integrated graphics
Date: Sat, 27 Jul 2019 13:49:00 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: ds2.bugs.freedesktop@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-111231-502-kRCMfCMUKA@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111231-502@http.bugs.freedesktop.org/>
References: <bug-111231-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0886971430=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0886971430==
Content-Type: multipart/alternative; boundary="15642353400.2dcB.7054"
Content-Transfer-Encoding: 7bit


--15642353400.2dcB.7054
Date: Sat, 27 Jul 2019 13:48:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111231

--- Comment #9 from deltasquared <ds2.bugs.freedesktop@gmail.com> ---
Created attachment 144889
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144889&action=3Dedit
Observed graphical corruption - left hand side of monitor

Taken in two photos as my screen's a rather large one.
This graphical corruption appears along the edges of some objects, which can
*sometimes* occur either when running minetest directly and loading a world=
 or
replaying the above api trace.
However, I notice that sometimes no graphical corruption occors whatsoever =
but
everything still freezes. That's on top of the fact that the freeze itself
doesn't happen all the time... suggests something highly indetermistic at p=
lay?
Sometimes it flickers to a similarly corrupted version of the minetest logo
before the freeze, haven't caught that on camera yet.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15642353400.2dcB.7054
Date: Sat, 27 Jul 2019 13:49:00 +0000
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
   title=3D"NEW - random VM_L2_PROTECTION_FAULTs when loading a world in mi=
netest on AMD ryzen 2200G integrated graphics"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111231#c9">Commen=
t # 9</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - random VM_L2_PROTECTION_FAULTs when loading a world in mi=
netest on AMD ryzen 2200G integrated graphics"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111231">bug 11123=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
ds2.bugs.freedesktop&#64;gmail.com" title=3D"deltasquared &lt;ds2.bugs.free=
desktop&#64;gmail.com&gt;"> <span class=3D"fn">deltasquared</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144889=
" name=3D"attach_144889" title=3D"Observed graphical corruption - left hand=
 side of monitor">attachment 144889</a> <a href=3D"attachment.cgi?id=3D1448=
89&amp;action=3Dedit" title=3D"Observed graphical corruption - left hand si=
de of monitor">[details]</a></span>
Observed graphical corruption - left hand side of monitor

Taken in two photos as my screen's a rather large one.
This graphical corruption appears along the edges of some objects, which can
*sometimes* occur either when running minetest directly and loading a world=
 or
replaying the above api trace.
However, I notice that sometimes no graphical corruption occors whatsoever =
but
everything still freezes. That's on top of the fact that the freeze itself
doesn't happen all the time... suggests something highly indetermistic at p=
lay?
Sometimes it flickers to a similarly corrupted version of the minetest logo
before the freeze, haven't caught that on camera yet.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15642353400.2dcB.7054--

--===============0886971430==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0886971430==--
