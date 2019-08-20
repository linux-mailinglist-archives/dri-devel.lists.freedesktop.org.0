Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE819565C
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 06:56:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 626386E5CE;
	Tue, 20 Aug 2019 04:56:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 829236E5CF
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 04:56:54 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 7F72B72161; Tue, 20 Aug 2019 04:56:54 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109380] [CI][BAT] igt@kms_chamelium@*- warn/fail - Last errno:
 113, No route to host
Date: Tue, 20 Aug 2019 04:56:54 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: IGT
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: arkadiusz.hiler@intel.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: FIXED
X-Bugzilla-Priority: high
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-109380-502-5THOtBSDji@http.bugs.freedesktop.org/>
In-Reply-To: <bug-109380-502@http.bugs.freedesktop.org/>
References: <bug-109380-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1511659943=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1511659943==
Content-Type: multipart/alternative; boundary="15662770143.5bCaadc.12010"
Content-Transfer-Encoding: 7bit


--15662770143.5bCaadc.12010
Date: Tue, 20 Aug 2019 04:56:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109380

Arek Hiler <arkadiusz.hiler@intel.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #7 from Arek Hiler <arkadiusz.hiler@intel.com> ---
https://gitlab.freedesktop.org/drm/igt-gpu-tools/commit/ce130a078c85ce3f2bd=
b02047cba5b72702a79c3

And from pre-merge CI:

#### Possible fixes ####

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-kbl-7567u:       [WARN][15] ([fdo#109380]) -> [PASS][16]
   [15]:
https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6734/fi-kbl-7567u/igt@kms_c=
hamelium@common-hpd-after-suspend.html
   [16]:
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3363/fi-kbl-7567u/igt@kms_ch=
amelium@common-hpd-after-suspend.html

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15662770143.5bCaadc.12010
Date: Tue, 20 Aug 2019 04:56:54 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:arkadiusz=
.hiler&#64;intel.com" title=3D"Arek Hiler &lt;arkadiusz.hiler&#64;intel.com=
&gt;"> <span class=3D"fn">Arek Hiler</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - [CI][BAT] igt&#64;kms_chamelium&#64;*- warn/fa=
il - Last errno: 113, No route to host"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109380">bug 10938=
0</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Status</td>
           <td>NEW
           </td>
           <td>RESOLVED
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Resolution</td>
           <td>---
           </td>
           <td>FIXED
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - [CI][BAT] igt&#64;kms_chamelium&#64;*- warn/fa=
il - Last errno: 113, No route to host"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109380#c7">Commen=
t # 7</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - [CI][BAT] igt&#64;kms_chamelium&#64;*- warn/fa=
il - Last errno: 113, No route to host"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109380">bug 10938=
0</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
arkadiusz.hiler&#64;intel.com" title=3D"Arek Hiler &lt;arkadiusz.hiler&#64;=
intel.com&gt;"> <span class=3D"fn">Arek Hiler</span></a>
</span></b>
        <pre><a href=3D"https://gitlab.freedesktop.org/drm/igt-gpu-tools/co=
mmit/ce130a078c85ce3f2bdb02047cba5b72702a79c3">https://gitlab.freedesktop.o=
rg/drm/igt-gpu-tools/commit/ce130a078c85ce3f2bdb02047cba5b72702a79c3</a>

And from pre-merge CI:

#### Possible fixes ####

  * igt&#64;kms_chamelium&#64;common-hpd-after-suspend:
    - fi-kbl-7567u:       [WARN][15] ([fdo#109380]) -&gt; [PASS][16]
   [15]:
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6734/fi-kbl-7567=
u/igt&#64;kms_chamelium&#64;common-hpd-after-suspend.html">https://intel-gf=
x-ci.01.org/tree/drm-tip/CI_DRM_6734/fi-kbl-7567u/igt&#64;kms_chamelium&#64=
;common-hpd-after-suspend.html</a>
   [16]:
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3363/fi-kbl-7567u=
/igt&#64;kms_chamelium&#64;common-hpd-after-suspend.html">https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_3363/fi-kbl-7567u/igt&#64;kms_chamelium&#64;c=
ommon-hpd-after-suspend.html</a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15662770143.5bCaadc.12010--

--===============1511659943==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1511659943==--
