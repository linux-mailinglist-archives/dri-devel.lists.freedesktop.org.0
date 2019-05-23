Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A3B27C96
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2019 14:19:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32EAC89B51;
	Thu, 23 May 2019 12:19:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7635989BAE
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2019 12:19:12 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 733BB72167; Thu, 23 May 2019 12:19:12 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110736] Spotify rendering issues
Date: Thu, 23 May 2019 12:19:12 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: 0xe2.0x9a.0x9b@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 qa_contact attachments.created
Message-ID: <bug-110736-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1500086135=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1500086135==
Content-Type: multipart/alternative; boundary="15586139522.0BEc2d21.20158"
Content-Transfer-Encoding: 7bit


--15586139522.0BEc2d21.20158
Date: Thu, 23 May 2019 12:19:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110736

            Bug ID: 110736
           Summary: Spotify rendering issues
           Product: Mesa
           Version: git
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/Gallium/radeonsi
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: 0xe2.0x9a.0x9b@gmail.com
        QA Contact: dri-devel@lists.freedesktop.org

Created attachment 144330
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144330&action=3Dedit
Screenshot_20190523_135549.png

Hello.

I am experiencing Spotify rendering issues with Mesa 19.0.5, 19.1.0-rc3 and
git. Mesa 18.3.6 has no rendering issues.

Please see the attached screenshot.

This issue might be triggered by a special combination of Mesa and other
graphics libraries, because there exist points in time where there were no
rendering issues when using Mesa versions 19.1.0-rc3 and git.

Passing --disable-gpu to Spotify removes the rendering issues.

Spotify 1.1.5 download location:
http://repository-origin.spotify.com/pool/non-free/s/spotify-client/

$ glversion=20
4.5 (Core Profile) Mesa 19.1.0-rc3
AMD Radeon (TM) RX 470/570 Graphics (POLARIS10, DRM 3.30.0, 5.1.0, LLVM 8.0=
.0)

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15586139522.0BEc2d21.20158
Date: Thu, 23 May 2019 12:19:12 +0000
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
   title=3D"NEW - Spotify rendering issues"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110736">110736</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Spotify rendering issues
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
          <td>0xe2.0x9a.0x9b&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>dri-devel&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144330=
" name=3D"attach_144330" title=3D"Screenshot_20190523_135549.png">attachmen=
t 144330</a> <a href=3D"attachment.cgi?id=3D144330&amp;action=3Dedit" title=
=3D"Screenshot_20190523_135549.png">[details]</a></span>
Screenshot_20190523_135549.png

Hello.

I am experiencing Spotify rendering issues with Mesa 19.0.5, 19.1.0-rc3 and
git. Mesa 18.3.6 has no rendering issues.

Please see the attached screenshot.

This issue might be triggered by a special combination of Mesa and other
graphics libraries, because there exist points in time where there were no
rendering issues when using Mesa versions 19.1.0-rc3 and git.

Passing --disable-gpu to Spotify removes the rendering issues.

Spotify 1.1.5 download location:
<a href=3D"http://repository-origin.spotify.com/pool/non-free/s/spotify-cli=
ent/">http://repository-origin.spotify.com/pool/non-free/s/spotify-client/<=
/a>

$ glversion=20
4.5 (Core Profile) Mesa 19.1.0-rc3
AMD Radeon (TM) RX 470/570 Graphics (POLARIS10, DRM 3.30.0, 5.1.0, LLVM 8.0=
.0)</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15586139522.0BEc2d21.20158--

--===============1500086135==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1500086135==--
