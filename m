Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24146101E47
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 09:46:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13E0A6EDC1;
	Tue, 19 Nov 2019 08:46:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id CEC716EDCE
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2019 08:45:58 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id CB6AC720E2; Tue, 19 Nov 2019 08:45:58 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111988] Kernel WARNING related to Xorg happening in every boot
Date: Tue, 19 Nov 2019 08:45:58 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/Intel
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: not set
X-Bugzilla-Who: martin.peres@free.fr
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: intel-gfx-bugs@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: component cc cf_i915_features assigned_to
 qa_contact cf_i915_platform
Message-ID: <bug-111988-502-xKg4OrWoYU@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111988-502@http.bugs.freedesktop.org/>
References: <bug-111988-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1107521473=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1107521473==
Content-Type: multipart/alternative; boundary="15741531583.DCDdA6c.24838"
Content-Transfer-Encoding: 7bit


--15741531583.DCDdA6c.24838
Date: Tue, 19 Nov 2019 08:45:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111988

Martin Peres <martin.peres@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
          Component|DRM/other                   |DRM/Intel
                 CC|                            |intel-gfx-bugs@lists.freede
                   |                            |sktop.org
      i915 features|                            |GEM/Other
           Assignee|dri-devel@lists.freedesktop |intel-gfx-bugs@lists.freede
                   |.org                        |sktop.org
         QA Contact|                            |intel-gfx-bugs@lists.freede
                   |                            |sktop.org
      i915 platform|                            |SKL

--- Comment #1 from Martin Peres <martin.peres@free.fr> ---
Moving the bug to DRM/Intel.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15741531583.DCDdA6c.24838
Date: Tue, 19 Nov 2019 08:45:58 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:martin.pe=
res&#64;free.fr" title=3D"Martin Peres &lt;martin.peres&#64;free.fr&gt;"> <=
span class=3D"fn">Martin Peres</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Kernel WARNING related to Xorg happening in every boot"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111988">bug 11198=
8</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Component</td>
           <td>DRM/other
           </td>
           <td>DRM/Intel
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">CC</td>
           <td>
               &nbsp;
           </td>
           <td>intel-gfx-bugs&#64;lists.freedesktop.org
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">i915 features</td>
           <td>
               &nbsp;
           </td>
           <td>GEM/Other
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Assignee</td>
           <td>dri-devel&#64;lists.freedesktop.org
           </td>
           <td>intel-gfx-bugs&#64;lists.freedesktop.org
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">QA Contact</td>
           <td>
               &nbsp;
           </td>
           <td>intel-gfx-bugs&#64;lists.freedesktop.org
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">i915 platform</td>
           <td>
               &nbsp;
           </td>
           <td>SKL
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Kernel WARNING related to Xorg happening in every boot"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111988#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Kernel WARNING related to Xorg happening in every boot"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111988">bug 11198=
8</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
martin.peres&#64;free.fr" title=3D"Martin Peres &lt;martin.peres&#64;free.f=
r&gt;"> <span class=3D"fn">Martin Peres</span></a>
</span></b>
        <pre>Moving the bug to DRM/Intel.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15741531583.DCDdA6c.24838--

--===============1107521473==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1107521473==--
