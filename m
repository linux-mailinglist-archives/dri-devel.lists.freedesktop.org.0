Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58967194AAB
	for <lists+dri-devel@lfdr.de>; Thu, 26 Mar 2020 22:35:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CC296E947;
	Thu, 26 Mar 2020 21:34:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 961 seconds by postgrey-1.36 at gabe;
 Thu, 26 Mar 2020 13:00:04 UTC
Received: from huawei.com (lhrrgout.huawei.com [185.176.76.210])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F62A6E359
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Mar 2020 13:00:03 +0000 (UTC)
Received: from lhreml709-cah.china.huawei.com (unknown [172.18.7.108])
 by Forcepoint Email with ESMTP id DB07DE27201CDD85434C;
 Thu, 26 Mar 2020 12:43:59 +0000 (GMT)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 lhreml709-cah.china.huawei.com (10.201.108.32) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Thu, 26 Mar 2020 12:43:59 +0000
Received: from localhost (10.47.88.85) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 26 Mar
 2020 12:43:58 +0000
Date: Thu, 26 Mar 2020 12:43:49 +0000
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: "Ardelean, Alexandru" <alexandru.Ardelean@analog.com>
Subject: Re: [PATCH 1/4] dt-bindings: iio/accel: Drop duplicate adi,
 adxl345/6 from trivial-devices.yaml
Message-ID: <20200326124349.00001d32@Huawei.com>
In-Reply-To: <ede75c098e3e354ff7e93e4e1d6191e35ea1fbd2.camel@analog.com>
References: <20200325220542.19189-1-robh@kernel.org>
 <20200325220542.19189-2-robh@kernel.org>
 <ede75c098e3e354ff7e93e4e1d6191e35ea1fbd2.camel@analog.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; i686-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.47.88.85]
X-ClientProxiedBy: lhreml739-chm.china.huawei.com (10.201.108.189) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 26 Mar 2020 21:34:52 +0000
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
Cc: "narmstrong@baylibre.com" <narmstrong@baylibre.com>,
 "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "yamada.masahiro@socionext.com" <yamada.masahiro@socionext.com>,
 "glaroque@baylibre.com" <glaroque@baylibre.com>,
 "pmeerw@pmeerw.net" <pmeerw@pmeerw.net>,
 "lee.jones@linaro.org" <lee.jones@linaro.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "khilman@baylibre.com" <khilman@baylibre.com>,
 "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>,
 "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
 "rui.zhang@intel.com" <rui.zhang@intel.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "Hennerich, 
 Michael" <Michael.Hennerich@analog.com>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "sboyd@kernel.org" <sboyd@kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
 "knaack.h@gmx.de" <knaack.h@gmx.de>,
 "masneyb@onstation.org" <masneyb@onstation.org>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "jic23@kernel.org" <jic23@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 26 Mar 2020 07:57:31 +0000
"Ardelean, Alexandru" <alexandru.Ardelean@analog.com> wrote:

> On Wed, 2020-03-25 at 16:05 -0600, Rob Herring wrote:
> > [External]
> > 
> > The 'adi,adxl345' definition is a duplicate as there's a full binding in:
> > Documentation/devicetree/bindings/iio/accel/adi,adxl345.yaml
> > 
> > The trivial-devices binding doesn't capture that 'adi,adxl346' has a
> > fallback compatible 'adi,adxl345', so let's add it to adi,adxl345.yaml.
> >   
> 
> Acked-by: Alexandru Ardelean <alexandru.ardelean@analog.com>

Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> 
> > Cc: Michael Hennerich <michael.hennerich@analog.com>
> > Cc: Jonathan Cameron <jic23@kernel.org>
> > Cc: Hartmut Knaack <knaack.h@gmx.de>
> > Cc: Lars-Peter Clausen <lars@metafoo.de>
> > Cc: Peter Meerwald-Stadler <pmeerw@pmeerw.net>
> > Cc: linux-iio@vger.kernel.org
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > ---
> >  .../devicetree/bindings/iio/accel/adi,adxl345.yaml     | 10 +++++++---
> >  Documentation/devicetree/bindings/trivial-devices.yaml |  4 ----
> >  2 files changed, 7 insertions(+), 7 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/iio/accel/adi,adxl345.yaml
> > b/Documentation/devicetree/bindings/iio/accel/adi,adxl345.yaml
> > index c602b6fe1c0c..d124eba1ce54 100644
> > --- a/Documentation/devicetree/bindings/iio/accel/adi,adxl345.yaml
> > +++ b/Documentation/devicetree/bindings/iio/accel/adi,adxl345.yaml
> > @@ -17,9 +17,13 @@ description: |
> >  
> >  properties:
> >    compatible:
> > -    enum:
> > -      - adi,adxl345
> > -      - adi,adxl375
> > +    oneOf:
> > +      - items:
> > +          - const: adi,adxl346
> > +          - const: adi,adxl345
> > +      - enum:
> > +          - adi,adxl345
> > +          - adi,adxl375
> >  
> >    reg:
> >      maxItems: 1
> > diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml
> > b/Documentation/devicetree/bindings/trivial-devices.yaml
> > index 978de7d37c66..51d1f6e43c02 100644
> > --- a/Documentation/devicetree/bindings/trivial-devices.yaml
> > +++ b/Documentation/devicetree/bindings/trivial-devices.yaml
> > @@ -42,10 +42,6 @@ properties:
> >            - adi,adt7476
> >              # +/-1C TDM Extended Temp Range I.C
> >            - adi,adt7490
> > -            # Three-Axis Digital Accelerometer
> > -          - adi,adxl345
> > -            # Three-Axis Digital Accelerometer (backward-compatibility value
> > "adi,adxl345" must be listed too)
> > -          - adi,adxl346
> >              # AMS iAQ-Core VOC Sensor
> >            - ams,iaq-core
> >              # i2c serial eeprom  (24cxx)  
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
