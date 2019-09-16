Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D36EB392F
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2019 13:15:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DAA96E917;
	Mon, 16 Sep 2019 11:15:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 49DBB6E917
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2019 11:15:04 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 3E21372168; Mon, 16 Sep 2019 11:15:04 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111694] [CI][DRMTIP] igt@kms_hdmi_inject@inject-audio - fail -
 Failed assertion: glob("/proc/asound/card*/" ELD_PREFIX "*", GLOB_NOSORT,
 NULL, &glob_buf) == 0, glob failed
Date: Mon, 16 Sep 2019 11:15:04 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/other
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: not set
X-Bugzilla-Who: lakshminarayana.vudum@intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
Message-ID: <bug-111694-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0682956775=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0682956775==
Content-Type: multipart/alternative; boundary="15686325041.dD5B5.19350"
Content-Transfer-Encoding: 7bit


--15686325041.dD5B5.19350
Date: Mon, 16 Sep 2019 11:15:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111694

            Bug ID: 111694
           Summary: [CI][DRMTIP] igt@kms_hdmi_inject@inject-audio - fail -
                    Failed assertion: glob("/proc/asound/card*/"
                    ELD_PREFIX "*", GLOB_NOSORT, NULL, &glob_buf) =3D=3D 0,
                    glob failed
           Product: DRI
           Version: DRI git
          Hardware: Other
                OS: All
            Status: NEW
          Severity: not set
          Priority: not set
         Component: DRM/other
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: lakshminarayana.vudum@intel.com

https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_369/fi-bdw-gvtdvm/igt@kms_h=
dmi_inject@inject-audio.html

Starting subtest: inject-audio
(kms_hdmi_inject:1026) igt_eld-CRITICAL: Test assertion failure function
eld_is_supported, file ../lib/igt_eld.c:277:
(kms_hdmi_inject:1026) igt_eld-CRITICAL: Failed assertion:
glob("/proc/asound/card*/" ELD_PREFIX "*", GLOB_NOSORT, NULL, &glob_buf) =
=3D=3D 0
(kms_hdmi_inject:1026) igt_eld-CRITICAL: glob failed
Subtest inject-audio failed.

https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_370/fi-tgl-u2/igt@kms_hdmi_=
inject@inject-audio.html
Starting subtest: inject-audio
(kms_hdmi_inject:1023) igt_eld-CRITICAL: Test assertion failure function
eld_is_supported, file ../lib/igt_eld.c:277:
(kms_hdmi_inject:1023) igt_eld-CRITICAL: Failed assertion:
glob("/proc/asound/card*/" ELD_PREFIX "*", GLOB_NOSORT, NULL, &glob_buf) =
=3D=3D 0
(kms_hdmi_inject:1023) igt_eld-CRITICAL: glob failed
Subtest inject-audio failed.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15686325041.dD5B5.19350
Date: Mon, 16 Sep 2019 11:15:04 +0000
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
   title=3D"NEW - [CI][DRMTIP] igt&#64;kms_hdmi_inject&#64;inject-audio - f=
ail - Failed assertion: glob(&quot;/proc/asound/card*/&quot; ELD_PREFIX &qu=
ot;*&quot;, GLOB_NOSORT, NULL, &amp;glob_buf) =3D=3D 0, glob failed"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111694">111694</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[CI][DRMTIP] igt&#64;kms_hdmi_inject&#64;inject-audio - fail =
- Failed assertion: glob(&quot;/proc/asound/card*/&quot; ELD_PREFIX &quot;*=
&quot;, GLOB_NOSORT, NULL, &amp;glob_buf) =3D=3D 0, glob failed
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
          <td>DRM/other
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>dri-devel&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>lakshminarayana.vudum&#64;intel.com
          </td>
        </tr></table>
      <p>
        <div>
        <pre><a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_369=
/fi-bdw-gvtdvm/igt&#64;kms_hdmi_inject&#64;inject-audio.html">https://intel=
-gfx-ci.01.org/tree/drm-tip/drmtip_369/fi-bdw-gvtdvm/igt&#64;kms_hdmi_injec=
t&#64;inject-audio.html</a>

Starting subtest: inject-audio
(kms_hdmi_inject:1026) igt_eld-CRITICAL: Test assertion failure function
eld_is_supported, file ../lib/igt_eld.c:277:
(kms_hdmi_inject:1026) igt_eld-CRITICAL: Failed assertion:
glob(&quot;/proc/asound/card*/&quot; ELD_PREFIX &quot;*&quot;, GLOB_NOSORT,=
 NULL, &amp;glob_buf) =3D=3D 0
(kms_hdmi_inject:1026) igt_eld-CRITICAL: glob failed
Subtest inject-audio failed.

<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_370/fi-tgl-u2/ig=
t&#64;kms_hdmi_inject&#64;inject-audio.html">https://intel-gfx-ci.01.org/tr=
ee/drm-tip/drmtip_370/fi-tgl-u2/igt&#64;kms_hdmi_inject&#64;inject-audio.ht=
ml</a>
Starting subtest: inject-audio
(kms_hdmi_inject:1023) igt_eld-CRITICAL: Test assertion failure function
eld_is_supported, file ../lib/igt_eld.c:277:
(kms_hdmi_inject:1023) igt_eld-CRITICAL: Failed assertion:
glob(&quot;/proc/asound/card*/&quot; ELD_PREFIX &quot;*&quot;, GLOB_NOSORT,=
 NULL, &amp;glob_buf) =3D=3D 0
(kms_hdmi_inject:1023) igt_eld-CRITICAL: glob failed
Subtest inject-audio failed.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15686325041.dD5B5.19350--

--===============0682956775==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0682956775==--
