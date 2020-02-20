Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 119F5167BD6
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2020 12:16:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04B916F42C;
	Fri, 21 Feb 2020 11:15:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail1.bemta24.messagelabs.com (mail1.bemta24.messagelabs.com
 [67.219.250.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 947FB6E8E7
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 15:14:50 +0000 (UTC)
Received: from [100.112.135.241] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-4.bemta.az-b.us-west-2.aws.symcld.net id 21/AA-41136-862AE4E5;
 Thu, 20 Feb 2020 15:14:48 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA1VTfUxTVxzt7Xt97xXp9gSUK5sGGpYhoV0LG3k
 qurkR8ticGw6VyOYso9KatrC2QNnIwuJwpsiHghlUoLXABojC2BwfRXCADoGAKegIyoiIDPAD
 J1MREPYeD932z805v3Puuecm9xKIWwnuRShNRqVep9CIMRc0bt0kLtlv375XNuTwpSZy2gB1L
 H8RoVp+h1T3nSGc6n84hVHmkzLqYEk1Rp1oC6EKx04D6oe+akCV/12AU32NhRjVYZlFqcm2AY
 w61TSOUOWV+eAtkm6wDOG0rTaRnjsP6J/K/enrV5swuvhSBN1SVIXTwxm/8WmHbZpPTzVfwej
 p2nUfrtgjUOti4k37BKrF8wOChBofk+P4DJIGZrzNwIVwIxcBHDsyjnNkHMCun0cRjqTz4Z30
 M3wzEDJkHsCSU56sAMgyBBZmVuEcuYhCe0X3MqkBMGN2GrAEJR0ILC1M43NhuXzYc2gA48gIg
 ENXzuJsMkb6QeuJApQVPMgcxvV93tJ+hBxEoCW9WsC63Mk98FuzgxEIxhUNm62hHAyEQ2e2sA
 6UfAW2fteGs2MRuQ8et5q44qnw7sGypaOEZATMzq/DWAzI1fBxZ9XS5RDSEw6OWpcwJElY2tS
 LcHgVnLi5IOD8O+HguSMCbu4NG7Mblv1rodOaATj8PqyoqlueB8Bf+vNQDofAC3/aULYaJH3h
 QmsKN46HHQ8r0BwQZPlPCwvjQsj1sLrxNW7sA/MybuAsFpEr4aWCUdQG0EoQHKNXx6mMWoVaI
 5HLZBK5PFAiDwqUBEsVX0hipIkGSbLSYJQEShXJBqkhRfuZJlaqUxprAfNGYxO+wepB7+kpaS
 tYQ/DFq0S7s7fvdXshJj42RaUwqD7VJ2qUhlbwMkGIochsY7SVemWc0rRfrWFe+jMZEq5iD9G
 ElZFFhgSF1qCO46ROsIHImSiyI8S9JyXM2l5UZkfcUF28TunlKUpg80h2gypR9zzu2d9xgrVe
 7iLA4/HcXBOUeq3a+H99EngSQOwuimJTXNU64/NTJ5lCfKbQlPs2tpBR8a/klcaH87P3d3Ruq
 G91hqYcTR3O/Ss0Uu5zaHzE5aOF0qDDsuvRG28mhTnmr222XqzeuqVmLvX2o5ie0k2vhn3p4Z
 T5+Y2PnR0WWng9X/mvGTzA67pftj5gR2XSH5KZkk/sSdGR5pDDZaQs+vI7n/u+3r5JqdG2K8Y
 C3kj5evXYe5bw25SPd+dO+oET74rO0sdGvbnN9cKKX+dq8hpCYz1Hi7NvXa7nh7VkVW7Oqhmu
 ExYJX3pa/2iX6cdehHf3Wlxke3DUSP/RD158es4r/N2iAUta9y1xcG7nyeS+vExHfTH2JOftj
 Zl25+77/fe0EX61NolGrtZXXe1QH9jV9vhBuGVr8w2hBX4sRg0qhdwf0RsU/wAXs/vFtgQAAA
 ==
X-Env-Sender: mpearson@lenovo.com
X-Msg-Ref: server-32.tower-346.messagelabs.com!1582211682!75939!1
X-Originating-IP: [103.30.234.7]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.44.25; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11895 invoked from network); 20 Feb 2020 15:14:45 -0000
Received: from unknown (HELO lenovo.com) (103.30.234.7)
 by server-32.tower-346.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 20 Feb 2020 15:14:45 -0000
Received: from reswpmail01.lenovo.com (unknown [10.62.32.20])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by Forcepoint Email with ESMTPS id 44D522E4C184FFB761FA;
 Thu, 20 Feb 2020 23:14:39 +0800 (CST)
Received: from reswpmail02.lenovo.com (10.62.32.21) by reswpmail01.lenovo.com
 (10.62.32.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.1779.2; Thu, 20 Feb
 2020 10:14:31 -0500
Received: from va32wusexedge01.lenovo.com (10.62.123.116) by
 reswpmail02.lenovo.com (10.62.32.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.1779.2
 via Frontend Transport; Thu, 20 Feb 2020 07:14:31 -0800
Received: from APC01-PU1-obe.outbound.protection.outlook.com (104.47.126.57)
 by mail.lenovo.com (10.62.123.116) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1779.2; Thu, 20 Feb 2020 23:14:30 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kc5u79maBXN3IoVNeWaba8o1mc2pPZpSOKQDxFCodcUR5SfSwTGzzBBYKn8/PTjOIh2qGd2pfVuuZUFQQeO+mL+SskGhhspxtvL0kqNmCEFTimlcn8xZ3cSTFakTP8x/AxHR/t7R/LIkB9EpTaQ+5Z0iUp05gGeEs2Dt5a1kOQ0yUrxJt2wZxg8OhAlBAoyXi4gBizTQUoaNnqO+TwNcaL0yGphxN5fIANLebjUx9POhln2x35yTC07IoMAU6TJRC+TTrovFahQkFq/YJZ6Kgtrfk90A2JewW2U2dLcqUiiEBhSh81D5sP57xNcgrYqanzdJ0X6XJ7TGVFpJ97CvBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uGWowALbmCst9N7V+BOIDhQPc21SXUxxPEtCbFvYGtU=;
 b=VdlJ5uaLEV4lg3y7kzyAqMlDY5UkQ3eKeYTShgaPhUqU8aLGpxfFOf/3qujxqOmjNh3mN4vJPnSb0I5jrGeUPyM8Y27GSwglQDqTO4fGQTMbUgsTg2Lr0XvsIq3Ws4sKsEI8QCE4ptCigSRg0N179izSLQ/MTyrwNWGDBH1AGDaQ6ezDUY2PNFvvPlBW9YObYFQB0iqXdpCGmj51WJk5ZGT+xnj0Atk4GAA7LkfRJG6/HUe0I8VNxuY9ZzefGhvyzLqLC8PWgq7roYqENkRR2xXljWAJP+P1DA0SVU0jWeVdNxZ3r7DhkSXXogZDvvOmFHmTHQ6ZVRdqp+86XbIf6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lenovo.com; dmarc=pass action=none header.from=lenovo.com;
 dkim=pass header.d=lenovo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=LenovoBeijing.onmicrosoft.com; s=selector2-LenovoBeijing-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uGWowALbmCst9N7V+BOIDhQPc21SXUxxPEtCbFvYGtU=;
 b=nHEtHXgKN0ei5F5XHmEdUfmIRGjcGUIR9BbQG50xLij+1rWPxJ5g7ev5nElgluAuEzeEkyKENFPyr9DFQ8X4JJNotPBSrFl1Fu9GeI2tHJblnQN7O4LOB6dEbE3oQE7T7U/1miwjzP9h7RS+/PGN2KmIcN+k9PaIw6kYKs3kcDY=
Received: from HK2PR0302MB2593.apcprd03.prod.outlook.com (10.170.146.17) by
 HK2PR0302MB2609.apcprd03.prod.outlook.com (10.170.149.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2750.9; Thu, 20 Feb 2020 15:14:26 +0000
Received: from HK2PR0302MB2593.apcprd03.prod.outlook.com
 ([fe80::20bc:254b:6c9:b694]) by HK2PR0302MB2593.apcprd03.prod.outlook.com
 ([fe80::20bc:254b:6c9:b694%10]) with mapi id 15.20.2750.016; Thu, 20 Feb 2020
 15:14:26 +0000
From: Mark Pearson <mpearson@lenovo.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>, Nitin Joshi
 <nitjoshi@gmail.com>, Mat King <mathewk@google.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Rajat Jain <rajatja@google.com>
Subject: RE: [External]  Re: [PATCH] thinkpad_acpi: Add sysfs entry for
 lcdshadow feature
Thread-Topic: [External]  Re: [PATCH] thinkpad_acpi: Add sysfs entry for
 lcdshadow feature
Thread-Index: AQHV59qPOpC1IkCjDkm9hRYaaz1mrqgkLFhg
Date: Thu, 20 Feb 2020 15:14:25 +0000
Message-ID: <HK2PR0302MB25937E2946BF38583B3A905DBD130@HK2PR0302MB2593.apcprd03.prod.outlook.com>
References: <20200220074637.7578-1-njoshi1@lenovo.com>
 <CAHp75VcJmEOu1-b7F2UAsv=Gujb=pPLzjz2ye9t4=Q68+ors-w@mail.gmail.com>
In-Reply-To: <CAHp75VcJmEOu1-b7F2UAsv=Gujb=pPLzjz2ye9t4=Q68+ors-w@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.48.229.69]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 58a4cd3c-0015-4f89-5271-08d7b61792db
x-ms-traffictypediagnostic: HK2PR0302MB2609:
x-ld-processed: 5c7d0b28-bdf8-410c-aa93-4df372b16203,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HK2PR0302MB2609F81AF71A1235858D9B04BD130@HK2PR0302MB2609.apcprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 031996B7EF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(376002)(136003)(346002)(396003)(39860400002)(199004)(189003)(7696005)(9686003)(5660300002)(52536014)(966005)(8676002)(81166006)(55016002)(33656002)(7416002)(478600001)(81156014)(54906003)(110136005)(71200400001)(26005)(66476007)(66946007)(76116006)(66556008)(66446008)(64756008)(186003)(86362001)(316002)(53546011)(4326008)(8936002)(6506007)(2906002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:HK2PR0302MB2609;
 H:HK2PR0302MB2593.apcprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: lenovo.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PAUMAejA6vHWKqRV6Y7VlrX6zJqpsOIik1JmxpvSyg1DrVjF1ER+50oOmJJ2kIgzyMg2BUMt67GWNkXnot/Zc5uNd2KU9inyXDMCpyQBZ25xf2Kye+Dk7ByMQI7xyEY652wi7K8RwiQvntWzLiK7oSahKuMFN9vUUXnkuQUfWabenmwmN3C7DRzzZG+puKqcdMOoMD6drbQOZc+gPRo9HMMqduyoAmBzM8yEKO/2MCiAj1hw2tLh78D8TXb6zqhFrdBXNSiHV+tpoSyQa+9O6HGGpkkFjw+zfGJiypNPfDGiQAVtCa4TgHKncexrS9GzWwKivUjrWwXZBC3N8Hqqh2QCqVsEvgLLS7MqBKIF/asOgL3aJZXKjuN6ZZDWlS10wzuvKvNIPzJB5nmdzMe5bAl6Bo9nZPry2WrYEhCFwgS6CEQ0wtSH1CxE8+CBde9V9JGSEzkW7caOH3IKdd3TzLfwct59/r/uLE/I18FgUxatqemmsq/4qZTQ+KYII8UuWxrumb0NHgMJ4fpoDpzSqw==
x-ms-exchange-antispam-messagedata: GD0kU7ARgXwv61Z+GmxJ6AYbKvmaoC0fZg/dICMaoiJo8g/MsVVFUffrMiNH9hqjQeIEvk/HRLC/sU+7pNGUzs1u4a8VfQqlNC1ncwbpb47ZSOJQ9YuE8ZyNQ7iFsc/3QN+2wqEp/lKAAc1JGzdiYA==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 58a4cd3c-0015-4f89-5271-08d7b61792db
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2020 15:14:25.8565 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k5qn2QB5seEfTIUEKFsqsVPDMDB86jtAQEy5pI5aScyaoXtWwRkluE7ssoTb9B8+5QRPGps83HGAgfF0DNGs3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR0302MB2609
X-OriginatorOrg: lenovo.com
X-Mailman-Approved-At: Fri, 21 Feb 2020 11:14:23 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Benjamin Berg <bberg@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Platform Driver <platform-driver-x86@vger.kernel.org>, Thinkpad-acpi
 devel ML <ibm-acpi-devel@lists.sourceforge.net>,
 Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>,
 Nitin Joshi1 <njoshi1@lenovo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andy

> -----Original Message-----
> From: Andy Shevchenko <andy.shevchenko@gmail.com>
> Sent: Thursday, February 20, 2020 5:43 AM
> 
> On Thu, Feb 20, 2020 at 9:48 AM Nitin Joshi <nitjoshi@gmail.com> wrote:
> >
> >   This feature is supported on some Thinkpad products like T490s, Thinkpad
> >   X1 yoga 4th Gen etc . The lcdshadow feature can be enabled and disabled
> >   when user press "Fn" + "D" key. Currently, no user feedback is given for
> >   this action. Adding as sysfs entry allows userspace to show an On Screen
> >   Display whenever the setting changes.
> >
> >   Summary of changes is mentioned below :
> >
> >  - Added TP_HKEY_EV_LCDSHADOW_CHANGED for consistency inside the
> driver
> >  - Added unmapped LCDSHADOW to keymap
> >  - Added lcdshadow_get function to read value using ACPI
> >  - Added lcdshadow_refresh function to re-read value and send notification
> >  - Added sysfs group creation to tpaci_lcdshadow_init
> >  - Added lcdshadow_exit to remove sysfs group again
> >  - Implemented lcdshadow_enable_show/lcdshadow_enable_store
> >  - Added handler to tpacpi_driver_event to update refresh lcdshadow
> >  - Explicitly call tpacpi_driver_event for extended keyset
> 
> Adding custom PrivacyGuard support to this driver was my mistake,
> There is a discussion [1] how to do this in generic way to cover other
> possible users.
> I Cc this to people from that discussion.
> 
> [1]: https://lore.kernel.org/dri-
> devel/CAL_quvRknSSVvXN3q_Se0hrziw2oTNS3ENNoeHYhvciCRq9Yww@mail
> .gmail.com/
> 
Thanks for the pointer to that thread - really useful and interesting, we weren't aware there was an ongoing exercise to do this.

I work with Nitin as part of the Linux team at Lenovo. We're trying to get more directly and actively involved in the open source community to improve the Linux experience on Lenovo devices and of course want to make sure we contribute the right way. We're all still pretty new so pointers and help are very much appreciated (we've been getting some great support from the distros to get us started).

For this particular issue what is the best way to contribute and get involved? We'd like to make it so ePrivacy can be used more easily from Linux. I agree a more generic way of controlling it would be good.
I looked at the proposed patch from Rajat (https://lkml.org/lkml/2019/10/22/967) - it seems like a good solution to me. We can help with testing that on our platforms if that would be useful.

I need to understand how we connect that implementation with the ACPI controls we have (as I believe what we have are thinkpad specific and not to a drm spec; we need to confirm that). We also have the ACPI events that notify if ePrivacy was changed by the hotkeys and that seems like something that should be done in thinkpad_acpi.c and not the drm code. Not sure if the two need to be connected somehow (or if handling the event is actually not important and polling is acceptable)?

As a note Nitin has been working with the Red Hat folk and is looking at the user space aspect of this (in particularl gnome settings) as well.

Thanks
Mark Pearson
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
