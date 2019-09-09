Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4AAAD4E6
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2019 10:31:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D820F89A08;
	Mon,  9 Sep 2019 08:31:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id B204489A08
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2019 08:31:39 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id A932572167; Mon,  9 Sep 2019 08:31:39 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111599] [CI][RESUME] igt@gem_ctx_isolation@* - skip - Test
 requirement: !(gen > LAST_KNOWN_GEN), SKIP
Date: Mon, 09 Sep 2019 08:31:39 +0000
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
Message-ID: <bug-111599-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============2077942635=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2077942635==
Content-Type: multipart/alternative; boundary="15680178990.dD0Ba2e6.6784"
Content-Transfer-Encoding: 7bit


--15680178990.dD0Ba2e6.6784
Date: Mon, 9 Sep 2019 08:31:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111599

            Bug ID: 111599
           Summary: [CI][RESUME] igt@gem_ctx_isolation@* - skip - Test
                    requirement: !(gen > LAST_KNOWN_GEN), SKIP
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

https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_362/fi-tgl-u/igt@gem_ctx_is=
olation@bcs0-dirty-switch.html

Test requirement not met in function __real_main808, file
../tests/i915/gem_ctx_isolation.c:827:
Test requirement: !(gen > LAST_KNOWN_GEN)
Subtest bcs0-dirty-switch: SKIP

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15680178990.dD0Ba2e6.6784
Date: Mon, 9 Sep 2019 08:31:39 +0000
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
   title=3D"NEW - [CI][RESUME] igt&#64;gem_ctx_isolation&#64;* - skip - Tes=
t requirement: !(gen &gt; LAST_KNOWN_GEN), SKIP"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111599">111599</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[CI][RESUME] igt&#64;gem_ctx_isolation&#64;* - skip - Test re=
quirement: !(gen &gt; LAST_KNOWN_GEN), SKIP
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
        <pre><a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_362=
/fi-tgl-u/igt&#64;gem_ctx_isolation&#64;bcs0-dirty-switch.html">https://int=
el-gfx-ci.01.org/tree/drm-tip/drmtip_362/fi-tgl-u/igt&#64;gem_ctx_isolation=
&#64;bcs0-dirty-switch.html</a>

Test requirement not met in function __real_main808, file
../tests/i915/gem_ctx_isolation.c:827:
Test requirement: !(gen &gt; LAST_KNOWN_GEN)
Subtest bcs0-dirty-switch: SKIP</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15680178990.dD0Ba2e6.6784--

--===============2077942635==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2077942635==--
