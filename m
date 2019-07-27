Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4465778DD
	for <lists+dri-devel@lfdr.de>; Sat, 27 Jul 2019 15:13:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A85786EEAB;
	Sat, 27 Jul 2019 13:13:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 69E5C6EEAB
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jul 2019 13:13:23 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 6632B72167; Sat, 27 Jul 2019 13:13:23 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111231] random VM_L2_PROTECTION_FAULTs when loading a world in
 minetest on AMD ryzen 2200G integrated graphics
Date: Sat, 27 Jul 2019 13:13:23 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: ds2.bugs.freedesktop@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: short_desc
Message-ID: <bug-111231-502-0NycgQdCd3@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1974657313=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1974657313==
Content-Type: multipart/alternative; boundary="15642332030.Cc20cB5b.30568"
Content-Transfer-Encoding: 7bit


--15642332030.Cc20cB5b.30568
Date: Sat, 27 Jul 2019 13:13:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111231

deltasquared <ds2.bugs.freedesktop@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|VM_L2_PROTECTION_FAULT when |random
                   |loading minetest on AMD     |VM_L2_PROTECTION_FAULTs
                   |ryzen 2200G integrated      |when loading a world in
                   |graphics                    |minetest on AMD ryzen 2200G
                   |                            |integrated graphics

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15642332030.Cc20cB5b.30568
Date: Sat, 27 Jul 2019 13:13:23 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:ds2.bugs.=
freedesktop&#64;gmail.com" title=3D"deltasquared &lt;ds2.bugs.freedesktop&#=
64;gmail.com&gt;"> <span class=3D"fn">deltasquared</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - random VM_L2_PROTECTION_FAULTs when loading a world in mi=
netest on AMD ryzen 2200G integrated graphics"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111231">bug 11123=
1</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Summary</td>
           <td>VM_L2_PROTECTION_FAULT when loading minetest on AMD ryzen 22=
00G integrated graphics
           </td>
           <td>random VM_L2_PROTECTION_FAULTs when loading a world in minet=
est on AMD ryzen 2200G integrated graphics
           </td>
         </tr></table>
      <p>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15642332030.Cc20cB5b.30568--

--===============1974657313==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1974657313==--
