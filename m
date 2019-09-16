Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DCE3B3932
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2019 13:16:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 871BD6E916;
	Mon, 16 Sep 2019 11:16:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9CC5D6E916
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2019 11:16:24 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 9926F72167; Mon, 16 Sep 2019 11:16:24 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111694] [CI][DRMTIP] igt@kms_hdmi_inject@inject-audio - fail -
 Failed assertion: glob("/proc/asound/card*/" ELD_PREFIX "*", GLOB_NOSORT,
 NULL, &glob_buf) == 0, glob failed
Date: Mon, 16 Sep 2019 11:16:24 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/Intel
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: not set
X-Bugzilla-Who: lakshminarayana.vudum@intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: intel-gfx-bugs@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: qa_contact cf_i915_platform component
 cf_i915_features assigned_to cc
Message-ID: <bug-111694-502-peEIiV2mqs@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111694-502@http.bugs.freedesktop.org/>
References: <bug-111694-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0219517076=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0219517076==
Content-Type: multipart/alternative; boundary="15686325840.086BAaD.20491"
Content-Transfer-Encoding: 7bit


--15686325840.086BAaD.20491
Date: Mon, 16 Sep 2019 11:16:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111694

Lakshmi <lakshminarayana.vudum@intel.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         QA Contact|                            |intel-gfx-bugs@lists.freede
                   |                            |sktop.org
      i915 platform|                            |TGL, KBL, SKL, BDW, IVB,
                   |                            |G45
          Component|DRM/other                   |DRM/Intel
      i915 features|                            |display/Other
           Assignee|dri-devel@lists.freedesktop |intel-gfx-bugs@lists.freede
                   |.org                        |sktop.org
                 CC|                            |intel-gfx-bugs@lists.freede
                   |                            |sktop.org

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15686325840.086BAaD.20491
Date: Mon, 16 Sep 2019 11:16:24 +0000
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
   title=3D"NEW - [CI][DRMTIP] igt&#64;kms_hdmi_inject&#64;inject-audio - f=
ail - Failed assertion: glob(&quot;/proc/asound/card*/&quot; ELD_PREFIX &qu=
ot;*&quot;, GLOB_NOSORT, NULL, &amp;glob_buf) =3D=3D 0, glob failed"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111694">bug 11169=
4</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
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
           <td>TGL, KBL, SKL, BDW, IVB, G45
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Component</td>
           <td>DRM/other
           </td>
           <td>DRM/Intel
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">i915 features</td>
           <td>
               &nbsp;
           </td>
           <td>display/Other
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
           <td style=3D"text-align:right;">CC</td>
           <td>
               &nbsp;
           </td>
           <td>intel-gfx-bugs&#64;lists.freedesktop.org
           </td>
         </tr></table>
      <p>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15686325840.086BAaD.20491--

--===============0219517076==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0219517076==--
