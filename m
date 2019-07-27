Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD6B77A7C
	for <lists+dri-devel@lfdr.de>; Sat, 27 Jul 2019 18:04:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53611899A3;
	Sat, 27 Jul 2019 16:04:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id B1FA289109
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jul 2019 16:04:22 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id AE49972167; Sat, 27 Jul 2019 16:04:22 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111233] Navi10 not booting to desktop - amdgpu_job_timedout
Date: Sat, 27 Jul 2019 16:04:22 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: Fursdon@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 attachments.created
Message-ID: <bug-111233-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0447970481=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0447970481==
Content-Type: multipart/alternative; boundary="15642434621.A78Da830.30386"
Content-Transfer-Encoding: 7bit


--15642434621.A78Da830.30386
Date: Sat, 27 Jul 2019 16:04:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111233

            Bug ID: 111233
           Summary: Navi10 not booting to desktop - amdgpu_job_timedout
           Product: DRI
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: DRM/AMDgpu
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: Fursdon@gmail.com

Created attachment 144892
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144892&action=3Dedit
dmesg output

Recent install of Ubuntu 18.04, on a brand new PC setup.

Installed Linux 5.3 using Ubuntu Kernel Update Utility.
Installed Mesa 19.2 through padoka PPA.
Manually pulled firmware files from=20
https://people.freedesktop.org/~agd5f/radeon_ucode/navi10/ into
/lib/firmware/amdgpu.

Booting will show the 'Ubunut 18.04' splash screen for around 5 seconds, and
then the display will turn black (but still active).

Attaching the dmesg and Xorg.log results to the ticket.

On a side note, I have been able to install the amdgpu-pro drivers
successfully, those are functional on the GPU.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15642434621.A78Da830.30386
Date: Sat, 27 Jul 2019 16:04:22 +0000
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
   title=3D"NEW - Navi10 not booting to desktop - amdgpu_job_timedout"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111233">111233</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Navi10 not booting to desktop - amdgpu_job_timedout
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>DRI
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
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
          <td>Fursdon&#64;gmail.com
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144892=
" name=3D"attach_144892" title=3D"dmesg output">attachment 144892</a> <a hr=
ef=3D"attachment.cgi?id=3D144892&amp;action=3Dedit" title=3D"dmesg output">=
[details]</a></span>
dmesg output

Recent install of Ubuntu 18.04, on a brand new PC setup.

Installed Linux 5.3 using Ubuntu Kernel Update Utility.
Installed Mesa 19.2 through padoka PPA.
Manually pulled firmware files from=20
<a href=3D"https://people.freedesktop.org/~agd5f/radeon_ucode/navi10/">http=
s://people.freedesktop.org/~agd5f/radeon_ucode/navi10/</a> into
/lib/firmware/amdgpu.

Booting will show the 'Ubunut 18.04' splash screen for around 5 seconds, and
then the display will turn black (but still active).

Attaching the dmesg and Xorg.log results to the ticket.

On a side note, I have been able to install the amdgpu-pro drivers
successfully, those are functional on the GPU.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15642434621.A78Da830.30386--

--===============0447970481==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0447970481==--
