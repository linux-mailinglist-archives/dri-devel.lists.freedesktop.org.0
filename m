Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE43B806C
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2019 19:49:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C664A6F8E8;
	Thu, 19 Sep 2019 17:49:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 104746F80A
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2019 17:49:01 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 06D3472167; Thu, 19 Sep 2019 17:49:01 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109628] WARNING at dcn10_hw_sequencer.c:868
 dcn10_verify_allow_pstate_change_high()
Date: Thu, 19 Sep 2019 17:49:01 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: vlad@ivanov.email
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-109628-502-WJdU26jFH3@http.bugs.freedesktop.org/>
In-Reply-To: <bug-109628-502@http.bugs.freedesktop.org/>
References: <bug-109628-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0626928632=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0626928632==
Content-Type: multipart/alternative; boundary="15689153400.f806B5.5005"
Content-Transfer-Encoding: 7bit


--15689153400.f806B5.5005
Date: Thu, 19 Sep 2019 17:49:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109628

--- Comment #20 from vlad@ivanov.email ---
Still seeing the warning with 5.4.0-0.rc0.git2.2.fc32.x86_64; waking up doe=
sn't
work. This is fedora kernel though and there's a possibility those patches
aren't integrated there yet; is there a way to check?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15689153400.f806B5.5005
Date: Thu, 19 Sep 2019 17:49:00 +0000
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
   title=3D"NEW - WARNING at dcn10_hw_sequencer.c:868 dcn10_verify_allow_ps=
tate_change_high()"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109628#c20">Comme=
nt # 20</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - WARNING at dcn10_hw_sequencer.c:868 dcn10_verify_allow_ps=
tate_change_high()"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109628">bug 10962=
8</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
vlad&#64;ivanov.email" title=3D"vlad&#64;ivanov.email">vlad&#64;ivanov.emai=
l</a>
</span></b>
        <pre>Still seeing the warning with 5.4.0-0.rc0.git2.2.fc32.x86_64; =
waking up doesn't
work. This is fedora kernel though and there's a possibility those patches
aren't integrated there yet; is there a way to check?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15689153400.f806B5.5005--

--===============0626928632==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0626928632==--
