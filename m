Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E527425A5A
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2019 00:37:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13101894C9;
	Tue, 21 May 2019 22:37:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id CE07C894C9
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2019 22:37:14 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id CB38E72167; Tue, 21 May 2019 22:37:14 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110721] graphics corruption on steam client with mesa 19.1.0
 rc3 on polaris
Date: Tue, 21 May 2019 22:37:14 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: edisonalvarez@arnet.com.ar
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 qa_contact attachments.created
Message-ID: <bug-110721-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1073327668=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1073327668==
Content-Type: multipart/alternative; boundary="15584782341.Fb8A28C3.31267"
Content-Transfer-Encoding: 7bit


--15584782341.Fb8A28C3.31267
Date: Tue, 21 May 2019 22:37:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110721

            Bug ID: 110721
           Summary: graphics corruption on steam client with mesa 19.1.0
                    rc3 on polaris
           Product: Mesa
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/Gallium/radeonsi
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: edisonalvarez@arnet.com.ar
        QA Contact: dri-devel@lists.freedesktop.org

Created attachment 144315
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144315&action=3Dedit
dmesg

it started happening with rc3.
Mesa compiled with llvm8
it happens both with the beta and stable channel.

https://i.imgur.com/7g2EK1G.png

Opensuse 15.0
Kernel 4.19.42
Radeon rx460 4gb

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15584782341.Fb8A28C3.31267
Date: Tue, 21 May 2019 22:37:14 +0000
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
   title=3D"NEW - graphics corruption on steam client with mesa 19.1.0 rc3 =
on polaris"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110721">110721</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>graphics corruption on steam client with mesa 19.1.0 rc3 on p=
olaris
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
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
          <td>edisonalvarez&#64;arnet.com.ar
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>dri-devel&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144315=
" name=3D"attach_144315" title=3D"dmesg">attachment 144315</a> <a href=3D"a=
ttachment.cgi?id=3D144315&amp;action=3Dedit" title=3D"dmesg">[details]</a><=
/span>
dmesg

it started happening with rc3.
Mesa compiled with llvm8
it happens both with the beta and stable channel.

<a href=3D"https://i.imgur.com/7g2EK1G.png">https://i.imgur.com/7g2EK1G.png=
</a>

Opensuse 15.0
Kernel 4.19.42
Radeon rx460 4gb</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15584782341.Fb8A28C3.31267--

--===============1073327668==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1073327668==--
