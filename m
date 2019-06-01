Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FBA931FB1
	for <lists+dri-devel@lfdr.de>; Sat,  1 Jun 2019 16:28:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 479EB89A20;
	Sat,  1 Jun 2019 14:28:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 083D089A20
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Jun 2019 14:28:15 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id F2D8172167; Sat,  1 Jun 2019 14:28:14 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110807] Regression: artifacts in Chromium after mesa 19.0.5
 update
Date: Sat, 01 Jun 2019 14:28:14 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: 19.0
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mezin.alexander@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 qa_contact attachments.created
Message-ID: <bug-110807-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1492148106=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1492148106==
Content-Type: multipart/alternative; boundary="15593992940.41bAA.12157"
Content-Transfer-Encoding: 7bit


--15593992940.41bAA.12157
Date: Sat, 1 Jun 2019 14:28:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110807

            Bug ID: 110807
           Summary: Regression: artifacts in Chromium after mesa 19.0.5
                    update
           Product: Mesa
           Version: 19.0
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/Gallium/radeonsi
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: mezin.alexander@gmail.com
        QA Contact: dri-devel@lists.freedesktop.org

Created attachment 144403
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144403&action=3Dedit
Artifacts in Chromium

mesa 19.0.4: Chromium works fine
mesa 19.0.5, 19.1.0-rc4 (haven't tested other 19.1 rcs yet): see attached
screenshot

Hardware: RX Vega 64 (Sapphire Nitro+)
Distro: Arch Linux
Kernel: 5.1.6, 4.19.47 - no difference
X.org server 1.20.5, no difference between modesetting and amdgpu drivers
chromium 74.0.3729.169

Not sure if it's a hardware-specific problem or generic mesa issue

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15593992940.41bAA.12157
Date: Sat, 1 Jun 2019 14:28:14 +0000
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
   title=3D"NEW - Regression: artifacts in Chromium after mesa 19.0.5 updat=
e"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110807">110807</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Regression: artifacts in Chromium after mesa 19.0.5 update
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>19.0
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
          <td>mezin.alexander&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>dri-devel&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144403=
" name=3D"attach_144403" title=3D"Artifacts in Chromium">attachment 144403<=
/a> <a href=3D"attachment.cgi?id=3D144403&amp;action=3Dedit" title=3D"Artif=
acts in Chromium">[details]</a></span>
Artifacts in Chromium

mesa 19.0.4: Chromium works fine
mesa 19.0.5, 19.1.0-rc4 (haven't tested other 19.1 rcs yet): see attached
screenshot

Hardware: RX Vega 64 (Sapphire Nitro+)
Distro: Arch Linux
Kernel: 5.1.6, 4.19.47 - no difference
X.org server 1.20.5, no difference between modesetting and amdgpu drivers
chromium 74.0.3729.169

Not sure if it's a hardware-specific problem or generic mesa issue</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15593992940.41bAA.12157--

--===============1492148106==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1492148106==--
