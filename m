Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B3D61E45
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 14:20:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F74489AB7;
	Mon,  8 Jul 2019 12:20:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4E69989AB7
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2019 12:20:18 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 4AF6872167; Mon,  8 Jul 2019 12:20:18 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111087] SteamOS fails to boot with "drmmode_do_crtc_dpms cannot
 get last vblank counter"
Date: Mon, 08 Jul 2019 12:20:17 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ludovico.denittis@collabora.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 attachments.created
Message-ID: <bug-111087-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0095863771=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0095863771==
Content-Type: multipart/alternative; boundary="15625884181.99c61a98.21258"
Content-Transfer-Encoding: 7bit


--15625884181.99c61a98.21258
Date: Mon, 8 Jul 2019 12:20:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111087

            Bug ID: 111087
           Summary: SteamOS fails to boot with "drmmode_do_crtc_dpms
                    cannot get last vblank counter"
           Product: DRI
           Version: XOrg git
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: DRM/AMDgpu
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: ludovico.denittis@collabora.com

Created attachment 144719
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144719&action=3Dedit
basic configuration details

When I try to boot SteamOS I end up with just a black screen.

Xorg.0.log contains this error but I'm not completely sure if it is the cau=
se:
(EE) AMDGPU(0): drmmode_do_crtc_dpms cannot get last vblank counter

I also tried installing debian kernel 5.0.2-1~exp1, mesa 19.1.1 and all the
relevant xserver-xorg-video-* 19.0.1 but the problem persisted.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15625884181.99c61a98.21258
Date: Mon, 8 Jul 2019 12:20:18 +0000
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
   title=3D"NEW - SteamOS fails to boot with &quot;drmmode_do_crtc_dpms can=
not get last vblank counter&quot;"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111087">111087</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>SteamOS fails to boot with &quot;drmmode_do_crtc_dpms cannot =
get last vblank counter&quot;
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>DRI
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>XOrg git
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
          <td>DRM/AMDgpu
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>dri-devel&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>ludovico.denittis&#64;collabora.com
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144719=
" name=3D"attach_144719" title=3D"basic configuration details">attachment 1=
44719</a> <a href=3D"attachment.cgi?id=3D144719&amp;action=3Dedit" title=3D=
"basic configuration details">[details]</a></span>
basic configuration details

When I try to boot SteamOS I end up with just a black screen.

Xorg.0.log contains this error but I'm not completely sure if it is the cau=
se:
(EE) AMDGPU(0): drmmode_do_crtc_dpms cannot get last vblank counter

I also tried installing debian kernel 5.0.2-1~exp1, mesa 19.1.1 and all the
relevant xserver-xorg-video-* 19.0.1 but the problem persisted.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15625884181.99c61a98.21258--

--===============0095863771==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0095863771==--
