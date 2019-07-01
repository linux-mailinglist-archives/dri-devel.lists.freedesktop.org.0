Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 453AB30D65
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2019 13:37:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B729D89308;
	Fri, 31 May 2019 11:37:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 32A2689307
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2019 11:37:24 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 2F81872167; Fri, 31 May 2019 11:37:24 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110730] [CI][RESUME] igt@kms_chamelium@hdmi-crc-single - crash
 - Received signal SIGSEGV.
Date: Fri, 31 May 2019 11:37:24 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: IGT
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lakshminarayana.vudum@intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: high
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: qa_contact component assigned_to
Message-ID: <bug-110730-502-SWM1uiMAkR@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110730-502@http.bugs.freedesktop.org/>
References: <bug-110730-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1721204612=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1721204612==
Content-Type: multipart/alternative; boundary="15593026441.07EadC9bD.29809"
Content-Transfer-Encoding: 7bit


--15593026441.07EadC9bD.29809
Date: Fri, 31 May 2019 11:37:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110730

Lakshmi <lakshminarayana.vudum@intel.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         QA Contact|intel-gfx-bugs@lists.freede |
                   |sktop.org                   |
          Component|DRM/Intel                   |IGT
           Assignee|intel-gfx-bugs@lists.freede |dri-devel@lists.freedesktop
                   |sktop.org                   |.org

--- Comment #3 from Lakshmi <lakshminarayana.vudum@intel.com> ---
Moving to IGT to fix the test.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15593026441.07EadC9bD.29809
Date: Fri, 31 May 2019 11:37:24 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:lakshmina=
rayana.vudum&#64;intel.com" title=3D"Lakshmi &lt;lakshminarayana.vudum&#64;=
intel.com&gt;"> <span class=3D"fn">Lakshmi</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [CI][RESUME] igt&#64;kms_chamelium&#64;hdmi-crc-single - =
crash - Received signal SIGSEGV."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110730">bug 11073=
0</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">QA Contact</td>
           <td>intel-gfx-bugs&#64;lists.freedesktop.org
           </td>
           <td>
               &nbsp;
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Component</td>
           <td>DRM/Intel
           </td>
           <td>IGT
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Assignee</td>
           <td>intel-gfx-bugs&#64;lists.freedesktop.org
           </td>
           <td>dri-devel&#64;lists.freedesktop.org
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [CI][RESUME] igt&#64;kms_chamelium&#64;hdmi-crc-single - =
crash - Received signal SIGSEGV."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110730#c3">Commen=
t # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [CI][RESUME] igt&#64;kms_chamelium&#64;hdmi-crc-single - =
crash - Received signal SIGSEGV."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110730">bug 11073=
0</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
lakshminarayana.vudum&#64;intel.com" title=3D"Lakshmi &lt;lakshminarayana.v=
udum&#64;intel.com&gt;"> <span class=3D"fn">Lakshmi</span></a>
</span></b>
        <pre>Moving to IGT to fix the test.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15593026441.07EadC9bD.29809--

--===============1721204612==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1721204612==--
