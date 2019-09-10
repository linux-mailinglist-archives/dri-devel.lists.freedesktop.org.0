Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35002AE818
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2019 12:28:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78C7B6E8AF;
	Tue, 10 Sep 2019 10:28:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6C2A96E8B0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2019 10:28:15 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 5F85272162; Tue, 10 Sep 2019 10:28:15 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111630] Generate a list of tags for the machine that runs the
 testsuite
Date: Tue, 10 Sep 2019 10:28:14 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: IGT
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: not set
X-Bugzilla-Who: martin.peres@free.fr
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
Message-ID: <bug-111630-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0606373569=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0606373569==
Content-Type: multipart/alternative; boundary="15681112951.f4574F.18221"
Content-Transfer-Encoding: 7bit


--15681112951.f4574F.18221
Date: Tue, 10 Sep 2019 10:28:15 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111630

            Bug ID: 111630
           Summary: Generate a list of tags for the machine that runs the
                    testsuite
           Product: DRI
           Version: XOrg git
          Hardware: Other
                OS: All
            Status: NEW
          Severity: not set
          Priority: not set
         Component: IGT
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: martin.peres@free.fr

Bug filing is done based on machine tags. They can be indicating a platform
(TGL, SKL, ...), or a configuration (HDMI, PSR, CHAMELIUM, ...).=20

This tagging is currently done manually, but it often is not in sync with t=
he
current platform state, which makes bug filing difficult and leads to random
noise in CI until the proper tag is set.

Since we would like individual developers and CI machines to have a consist=
ent
way of creating these tags (so as individual developers can filter out the
known issues from their run locally), having an IGT test/utility to generate
these tags would be ideal.

I'll let Arek explain how it could be done :)

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15681112951.f4574F.18221
Date: Tue, 10 Sep 2019 10:28:15 +0000
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
   title=3D"NEW - Generate a list of tags for the machine that runs the tes=
tsuite"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111630">111630</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Generate a list of tags for the machine that runs the testsui=
te
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
          <td>not set
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
          <td>martin.peres&#64;free.fr
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Bug filing is done based on machine tags. They can be indicati=
ng a platform
(TGL, SKL, ...), or a configuration (HDMI, PSR, CHAMELIUM, ...).=20

This tagging is currently done manually, but it often is not in sync with t=
he
current platform state, which makes bug filing difficult and leads to random
noise in CI until the proper tag is set.

Since we would like individual developers and CI machines to have a consist=
ent
way of creating these tags (so as individual developers can filter out the
known issues from their run locally), having an IGT test/utility to generate
these tags would be ideal.

I'll let Arek explain how it could be done :)</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15681112951.f4574F.18221--

--===============0606373569==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0606373569==--
