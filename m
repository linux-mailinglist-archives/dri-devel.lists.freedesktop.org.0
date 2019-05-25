Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E89B2A34B
	for <lists+dri-devel@lfdr.de>; Sat, 25 May 2019 09:20:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 311FF6E14A;
	Sat, 25 May 2019 07:20:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1FFC36E14A
 for <dri-devel@lists.freedesktop.org>; Sat, 25 May 2019 07:20:34 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 1CD8772167; Sat, 25 May 2019 07:20:34 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110760] Low FPS in Quake Champions with Vega20
Date: Sat, 25 May 2019 07:20:31 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: network723@rkmail.ru
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 qa_contact
Message-ID: <bug-110760-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0991139981=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0991139981==
Content-Type: multipart/alternative; boundary="15587688341.3fc44.18470"
Content-Transfer-Encoding: 7bit


--15587688341.3fc44.18470
Date: Sat, 25 May 2019 07:20:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110760

            Bug ID: 110760
           Summary: Low FPS in Quake Champions with Vega20
           Product: Mesa
           Version: git
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/Gallium/radeonsi
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: network723@rkmail.ru
        QA Contact: dri-devel@lists.freedesktop.org

I'm not sure if I should report it here or against DXVK. I've just installed
Radeon VII card on my Ryzen 7 1700 system, and FPS in Quake Champions
(Steam/Proton) is twice as lower as it was with RX480.
I've tried other applications like Unigine Superposition, Rise of Tomb Raid=
er,
and Witcher 3 (proton), and they seem to perform as expected (much faster t=
han
with RX480)
I've tried purging DXVK and Mesa caches, this does not seem to help. Also,
tried different DXVK versions.

HW spec:
Ryzen 1700
ASUS Prime X370 Pro
32 GiB ram
Sapphire Radeon VII

SW spec:
openSUSE 15.1
linux kernel 5.1.4
Mesa git 9fe1a925e2a4093cd88152a52ad48677d02f6ba5
llvm 9 rev 361414

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15587688341.3fc44.18470
Date: Sat, 25 May 2019 07:20:34 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
        <tr>
          <th>Bug ID</th>
          <td><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Low FPS in Quake Champions with Vega20"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110760">110760</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Low FPS in Quake Champions with Vega20
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>git
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>Other
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>All
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Drivers/Gallium/radeonsi
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>dri-devel&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>network723&#64;rkmail.ru
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>dri-devel&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>I'm not sure if I should report it here or against DXVK. I've =
just installed
Radeon VII card on my Ryzen 7 1700 system, and FPS in Quake Champions
(Steam/Proton) is twice as lower as it was with RX480.
I've tried other applications like Unigine Superposition, Rise of Tomb Raid=
er,
and Witcher 3 (proton), and they seem to perform as expected (much faster t=
han
with RX480)
I've tried purging DXVK and Mesa caches, this does not seem to help. Also,
tried different DXVK versions.

HW spec:
Ryzen 1700
ASUS Prime X370 Pro
32 GiB ram
Sapphire Radeon VII

SW spec:
openSUSE 15.1
linux kernel 5.1.4
Mesa git 9fe1a925e2a4093cd88152a52ad48677d02f6ba5
llvm 9 rev 361414</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15587688341.3fc44.18470--

--===============0991139981==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0991139981==--
