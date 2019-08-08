Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F9786914
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 20:53:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 359306E8AE;
	Thu,  8 Aug 2019 18:53:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id CB5206E8AE
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2019 18:53:20 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id C282C72167; Thu,  8 Aug 2019 18:53:20 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111334] amdgpu-pro-19.20-812932 fails to compile DKMS
Date: Thu, 08 Aug 2019 18:53:20 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu-pro
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: gustavo.diaz@gdnet.com.ar
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 attachments.created
Message-ID: <bug-111334-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============2103489340=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2103489340==
Content-Type: multipart/alternative; boundary="15652904000.CFEB9f.22293"
Content-Transfer-Encoding: 7bit


--15652904000.CFEB9f.22293
Date: Thu, 8 Aug 2019 18:53:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111334

            Bug ID: 111334
           Summary: amdgpu-pro-19.20-812932 fails to compile DKMS
           Product: DRI
           Version: XOrg git
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: DRM/AMDgpu-pro
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: gustavo.diaz@gdnet.com.ar

Created attachment 144985
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144985&action=3Dedit
Logs files

Hi,

I have problems installing amdgpu-pro driver, which fails when compiling DK=
MS,
no matter if use default kernel 4.15 or hwe, 5.0 in Ubuntu 18.04.2 (KDE Neon
flavor).

I am attaching all the related info and the log from the installation proce=
ss,
including the DKMS compile log.

Thanks in advance

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15652904000.CFEB9f.22293
Date: Thu, 8 Aug 2019 18:53:20 +0000
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
   title=3D"NEW - amdgpu-pro-19.20-812932 fails to compile DKMS"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111334">111334</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>amdgpu-pro-19.20-812932 fails to compile DKMS
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
          <td>gustavo.diaz&#64;gdnet.com.ar
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144985=
" name=3D"attach_144985" title=3D"Logs files">attachment 144985</a> <a href=
=3D"attachment.cgi?id=3D144985&amp;action=3Dedit" title=3D"Logs files">[det=
ails]</a></span>
Logs files

Hi,

I have problems installing amdgpu-pro driver, which fails when compiling DK=
MS,
no matter if use default kernel 4.15 or hwe, 5.0 in Ubuntu 18.04.2 (KDE Neon
flavor).

I am attaching all the related info and the log from the installation proce=
ss,
including the DKMS compile log.

Thanks in advance</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15652904000.CFEB9f.22293--

--===============2103489340==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2103489340==--
