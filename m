Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22EBAF5EB9
	for <lists+dri-devel@lfdr.de>; Sat,  9 Nov 2019 12:24:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3390E6E201;
	Sat,  9 Nov 2019 11:24:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 022136E201
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Nov 2019 11:24:26 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id F2D90720E2; Sat,  9 Nov 2019 11:24:25 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 112237] Cannot install AMDGPU Pro 19.30 - dependencies are a
 downgrade
Date: Sat, 09 Nov 2019 11:24:25 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu-pro
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocker
X-Bugzilla-Who: dl9220@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 attachments.created
Message-ID: <bug-112237-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0571087845=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0571087845==
Content-Type: multipart/alternative; boundary="15732986651.E4d9.31078"
Content-Transfer-Encoding: 7bit


--15732986651.E4d9.31078
Date: Sat, 9 Nov 2019 11:24:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D112237

            Bug ID: 112237
           Summary: Cannot install AMDGPU Pro 19.30 - dependencies are a
                    downgrade
           Product: DRI
           Version: XOrg git
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: blocker
          Priority: not set
         Component: DRM/AMDgpu-pro
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: dl9220@gmail.com

Created attachment 145923
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145923&action=3Dedit
Requested log-files

The instructions given to fix errors are not correct (apt --fix-broken inst=
all)
is wrong, should be (apt install --fix-broken) and even that is not working.
Dependencies requiere Gimp 2.10.12, fails when reading installed version (G=
imp
2.10.14) is higher.=20

Pls find all the logs you requested in attachments.

Cheers,

Dirk

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15732986651.E4d9.31078
Date: Sat, 9 Nov 2019 11:24:25 +0000
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
   title=3D"NEW - Cannot install AMDGPU Pro 19.30 - dependencies are a down=
grade"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112237">112237</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Cannot install AMDGPU Pro 19.30 - dependencies are a downgrade
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
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>blocker
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>not set
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>DRM/AMDgpu-pro
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>dri-devel&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>dl9220&#64;gmail.com
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145923=
" name=3D"attach_145923" title=3D"Requested log-files">attachment 145923</a=
> <a href=3D"attachment.cgi?id=3D145923&amp;action=3Dedit" title=3D"Request=
ed log-files">[details]</a></span>
Requested log-files

The instructions given to fix errors are not correct (apt --fix-broken inst=
all)
is wrong, should be (apt install --fix-broken) and even that is not working.
Dependencies requiere Gimp 2.10.12, fails when reading installed version (G=
imp
2.10.14) is higher.=20

Pls find all the logs you requested in attachments.

Cheers,

Dirk</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15732986651.E4d9.31078--

--===============0571087845==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0571087845==--
