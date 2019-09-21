Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6D9BA23B
	for <lists+dri-devel@lfdr.de>; Sun, 22 Sep 2019 14:05:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FB4E6E0DC;
	Sun, 22 Sep 2019 12:04:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id E75616E04A
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Sep 2019 06:59:54 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id DEF1A72162; Sat, 21 Sep 2019 06:59:54 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: =?UTF-8?B?W0J1ZyAxMTE3NjFdIExhdGVzdCBHaXQgS2VybmVsIGRvZXNu4oCZdCBib290?=
 =?UTF-8?B?IHdpdGggUmFkZW9uIE5JIHdpdGggdGhlIGRybS1uZXh0LTIwMTktMDktMTgg?=
 =?UTF-8?B?dXBkYXRlcw==?=
Date: Sat, 21 Sep 2019 06:59:55 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/Radeon
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: chzigotzky@xenosoft.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
Message-ID: <bug-111761-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1547650192=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1547650192==
Content-Type: multipart/alternative; boundary="15690491940.91fC.19435"
Content-Transfer-Encoding: 7bit


--15690491940.91fC.19435
Date: Sat, 21 Sep 2019 06:59:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111761

            Bug ID: 111761
           Summary: Latest Git Kernel doesn=E2=80=99t boot with Radeon NI w=
ith the
                    drm-next-2019-09-18 updates
           Product: DRI
           Version: DRI git
          Hardware: All
                OS: All
            Status: NEW
          Severity: critical
          Priority: not set
         Component: DRM/Radeon
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: chzigotzky@xenosoft.de

Hello,

I compiled the latest Git kernel with the new drm-next-2019-09-18 updates
yesterday.


Unfortunately it doesn't boot with my Radeon Northern Islands graphics cards
anymore. I tested it with a Radeon HD6870 and with a Radeon HD4870.=20

The kernel boots with a Radeon SI graphics card. (R7 240)=20

I reverted the latest DRM updates and after that the kernel boots with my
Radeon HD6870 and with my Radeon HD4870 without any problems.

Could you please test the latest Git kernel with the drm-next-2019-09-18
updates with Radeon NI graphics cards?

Thanks,
Christian

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15690491940.91fC.19435
Date: Sat, 21 Sep 2019 06:59:54 +0000
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
   title=3D"NEW - Latest Git Kernel doesn=E2=80=99t boot with Radeon NI wit=
h the drm-next-2019-09-18 updates"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111761">111761</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Latest Git Kernel doesn=E2=80=99t boot with Radeon NI with th=
e drm-next-2019-09-18 updates
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
          <td>All
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
          <td>critical
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>not set
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>DRM/Radeon
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>dri-devel&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>chzigotzky&#64;xenosoft.de
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Hello,

I compiled the latest Git kernel with the new drm-next-2019-09-18 updates
yesterday.


Unfortunately it doesn't boot with my Radeon Northern Islands graphics cards
anymore. I tested it with a Radeon HD6870 and with a Radeon HD4870.=20

The kernel boots with a Radeon SI graphics card. (R7 240)=20

I reverted the latest DRM updates and after that the kernel boots with my
Radeon HD6870 and with my Radeon HD4870 without any problems.

Could you please test the latest Git kernel with the drm-next-2019-09-18
updates with Radeon NI graphics cards?

Thanks,
Christian</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15690491940.91fC.19435--

--===============1547650192==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1547650192==--
