Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3D8B0953
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2019 09:18:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D5A56EC03;
	Thu, 12 Sep 2019 07:18:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8BA896EBFC
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2019 07:16:40 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 880BB72167; Thu, 12 Sep 2019 07:16:40 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111667] gem_render_copy failing on CCS subtests
Date: Thu, 12 Sep 2019 07:16:40 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: IGT
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: mika.kahola@intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
Message-ID: <bug-111667-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0346771884=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0346771884==
Content-Type: multipart/alternative; boundary="15682726001.4613a9fb.20358"
Content-Transfer-Encoding: 7bit


--15682726001.4613a9fb.20358
Date: Thu, 12 Sep 2019 07:16:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111667

            Bug ID: 111667
           Summary: gem_render_copy failing on CCS subtests
           Product: DRI
           Version: DRI git
          Hardware: Other
                OS: Linux (All)
            Status: NEW
          Severity: major
          Priority: not set
         Component: IGT
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: mika.kahola@intel.com

gem_render_copy is failing on CCS subtests on TGL

y-tiled-ccs-to-linear
y-tiled-ccs-to-x-tiled
y-tiled-ccs-to-y-tiled
y-tiled-ccs-to-yf-tiled
yf-tiled-ccs-to-linear
yf-tiled-ccs-to-x-tiled
yf-tiled-ccs-to-y-tiled
yf-tiled-ccs-to-yf-tiled

It seems that at least, rendercopy support for GEN12 is missing from upstre=
am
IGT.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15682726001.4613a9fb.20358
Date: Thu, 12 Sep 2019 07:16:40 +0000
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
   title=3D"NEW - gem_render_copy failing on CCS subtests"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111667">111667</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>gem_render_copy failing on CCS subtests
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>DRI
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>DRI git
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>Other
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
          <td>major
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>not set
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>IGT
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>dri-devel&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>mika.kahola&#64;intel.com
          </td>
        </tr></table>
      <p>
        <div>
        <pre>gem_render_copy is failing on CCS subtests on TGL

y-tiled-ccs-to-linear
y-tiled-ccs-to-x-tiled
y-tiled-ccs-to-y-tiled
y-tiled-ccs-to-yf-tiled
yf-tiled-ccs-to-linear
yf-tiled-ccs-to-x-tiled
yf-tiled-ccs-to-y-tiled
yf-tiled-ccs-to-yf-tiled

It seems that at least, rendercopy support for GEN12 is missing from upstre=
am
IGT.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15682726001.4613a9fb.20358--

--===============0346771884==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0346771884==--
